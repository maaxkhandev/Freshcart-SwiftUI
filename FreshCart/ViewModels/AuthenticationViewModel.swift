import Foundation
import FirebaseAuth
import FirebaseFirestore

enum AuthenticationState {
    case inital
    case unauthenticated
    case authenticating
    case authenticated
    case emailVerification
}

enum AuthenticationFlow {
    case login
    case signUp
}

@MainActor
class AuthenticationViewModel: ObservableObject {
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var flow: AuthenticationFlow = .login
    
    @Published var authenticationState: AuthenticationState = .inital
    @Published var errorMessage = ""
    @Published var user: User?
    let db = Firestore.firestore()
    
    init() {
        registerAuthStateHandler()
    }
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    func registerAuthStateHandler() {
        if authStateHandler == nil {
            authStateHandler = Auth.auth().addStateDidChangeListener { auth, user in
                self.user = user
                if let user = user {
                    if user.isEmailVerified {
                        self.authenticationState = .authenticated
                    } else {
                        self.authenticationState = .emailVerification
                    }
                } else {
                    self.authenticationState = .unauthenticated
                }
            }
        }
    }
    
    func switchFlow() {
        flow = flow == .login ? .signUp : .login
        errorMessage = ""
    }
    
    private func wait() async {
        do {
            print("Wait")
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("Done")
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func reset() {
        flow = .login
        email = ""
        password = ""
        userName = ""
    }
}

// MARK: - Email and Password Authentication

extension AuthenticationViewModel {
    func signInWithEmailPassword() async -> Bool {
        authenticationState = .authenticating
        do {
            print("email: \(email), password: \(password)")
            let result = try await Auth.auth().signIn(withEmail: self.email, password: self.password)
            if result.user.isEmailVerified {
                return true
            } else {
                authenticationState = .emailVerification
                return false
            }
        } catch {
            print(error)
            errorMessage = error.localizedDescription
            authenticationState = .unauthenticated
            return false
        }
    }
    
    func signUpWithEmailPassword() async -> Bool {
        authenticationState = .authenticating
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let changeRequest = result.user.createProfileChangeRequest()
            changeRequest.displayName = userName
            try await changeRequest.commitChanges()
            try await result.user.sendEmailVerification()
         
            authenticationState = .emailVerification
            return true
        } catch {
            print(error)
            errorMessage = error.localizedDescription
            authenticationState = .unauthenticated
            return false
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            reset()
        } catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func deleteAccount() async -> Bool {
        do {
            try await user?.delete()
            return true
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
    
    func resendEmailVerification() async {
        do {
            try await user?.sendEmailVerification()
        } catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func checkEmailVerificationStatus() async -> Bool {
        do {
            try await user?.reload()
            if user?.isEmailVerified == true {
                authenticationState = .authenticated
                return true
            } else {
                authenticationState = .emailVerification
                return false
            }
        } catch {
            print(error)
            errorMessage = error.localizedDescription
            return false
        }
    }
}
