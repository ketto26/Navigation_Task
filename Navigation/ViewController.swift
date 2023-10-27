import UIKit

// MARK: Properties
var emailTextField: UITextField!
var passwordTextField: UITextField!

class ViewController: UIViewController {
    // MARK: Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    // MARK: SetUP Methods
    private func setUp() {
        
        // MARK: Avatar & Sign In
        let personImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "avatar")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let signInLabel: UILabel = {
            let label = UILabel()
            label.text = "Sign In"
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // MARK: Sign In Fields
        emailTextField = createTextField(placeholder: "Email")
        passwordTextField = createTextField(placeholder: "Password")
        passwordTextField.isSecureTextEntry = true
        
        let forgotPasswordLabel: UILabel = {
            let label = UILabel()
            label.text = "Forgot Your Password?"
            label.textAlignment = .right
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let signInButton: UIButton = createButton(title: "Sign in")
        
        let signUpLabel: UILabel = {
            let label = UILabel()
            label.text = "Don't have an account? Sign Up"
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        emailTextField.heightAnchor.constraint(equalToConstant: 53).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 53).isActive = true

        signInButton.backgroundColor = UIColor(red: 34/255, green: 87/255, blue: 122/255, alpha: 1.0)
        signInButton.layer.cornerRadius = 22
        signInButton.clipsToBounds = true
        signInButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)

        
        // MARK: Social Icons
        let leftSeparatorView: UIView = {
            let view = UIView()
            view.backgroundColor = .lightGray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        let rightSeparatorView: UIView = {
            let view = UIView()
            view.backgroundColor = .lightGray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        let orLabel: UILabel = {
            let label = UILabel()
            label.text = "Or"
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

         let googleButton = createIconButton(imageName: "googleIcon")
         let facebookButton = createIconButton(imageName: "facebookIcon")
         let linkedInButton = createIconButton(imageName: "linkedInIcon")
        
        googleButton.imageView?.contentMode = .scaleAspectFit
            facebookButton.imageView?.contentMode = .scaleAspectFit
            linkedInButton.imageView?.contentMode = .scaleAspectFit

        //MARK: Stacks
        let socialIconsStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [googleButton, facebookButton, linkedInButton])
            stackView.axis = .horizontal
            stackView.spacing = 11  // Adjusted spacing to 11
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let orStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [leftSeparatorView, orLabel, rightSeparatorView])
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.spacing = 8
            stackView.distribution = .fillProportionally
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
         let mainStackView: UIStackView = {
             let stackView = UIStackView(arrangedSubviews: [personImage, signInLabel, emailTextField, passwordTextField, forgotPasswordLabel, signInButton, orStackView, socialIconsStackView, signUpLabel])
             stackView.axis = .vertical
             stackView.alignment = .fill
             stackView.spacing = 15
             stackView.translatesAutoresizingMaskIntoConstraints = false
             return stackView
         }()
        
        // MARK: Background
        view.backgroundColor = .systemBackground
        let backgroundImageView = UIImageView(image: UIImage(named: "Rectangle"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        
        // MARK: Constraints
        NSLayoutConstraint.activate([
            personImage.widthAnchor.constraint(equalToConstant: 160),
            personImage.heightAnchor.constraint(equalToConstant: 160),
            signInButton.heightAnchor.constraint(equalToConstant: 45),
            leftSeparatorView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 0.4),
            leftSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            orLabel.widthAnchor.constraint(equalToConstant: 30),
            rightSeparatorView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 0.4),
            rightSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            googleButton.widthAnchor.constraint(equalToConstant: 42),
            googleButton.heightAnchor.constraint(equalToConstant: 42),
            facebookButton.widthAnchor.constraint(equalToConstant: 42),
            facebookButton.heightAnchor.constraint(equalToConstant: 42),
            linkedInButton.widthAnchor.constraint(equalToConstant: 42),
            linkedInButton.heightAnchor.constraint(equalToConstant: 42),
            socialIconsStackView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            mainStackView.widthAnchor.constraint(equalToConstant: 280),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    // MARK: Methods
    private func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    private func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func createIconButton(imageName: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc func handleSignIn() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            let alert = UIAlertController(title: "Error", message: "Email and Password cannot be empty.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }

     // MARK: HomePage Atributes 
        let homeViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        self.present(navigationController, animated: true, completion: nil)
    }
}
