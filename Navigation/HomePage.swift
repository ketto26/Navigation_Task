import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Properties
    var presentButton: UIButton!
    var pushButton: UIButton!

    // MARK: Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // MARK: StackView
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Present Button
        presentButton = UIButton(type: .system)
        presentButton.setTitle("Present Color Palette Page", for: .normal)
        presentButton.addTarget(self, action: #selector(presentColorPalette), for: .touchUpInside)

        // MARK: Push Button
        pushButton = UIButton(type: .system)
        pushButton.setTitle("Push Color Palette Page", for: .normal)
        pushButton.addTarget(self, action: #selector(pushColorPalette), for: .touchUpInside)

        stackView.addArrangedSubview(presentButton)
        stackView.addArrangedSubview(pushButton)
        
        view.addSubview(stackView)

        // MARK: Constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: Methods
    @objc func presentColorPalette() {
        let colorPaletteViewController = ColorPaletteViewController()
        colorPaletteViewController.delegate = self
        self.present(colorPaletteViewController, animated: true, completion: nil)
    }
    
    @objc func pushColorPalette() {
        let colorPaletteViewController = ColorPaletteViewController()
        colorPaletteViewController.delegate = self
        self.navigationController?.pushViewController(colorPaletteViewController, animated: true)
    }

    func changeButtonBackgroundColor(to colour: UIColor) {
        presentButton.backgroundColor = colour
        pushButton.backgroundColor = colour
    }

    func changeViewBackgroundColor(to colour: UIColor) {
        self.view.backgroundColor = colour
    }
}
