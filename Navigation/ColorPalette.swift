//
//  ColorPalette.swift
//  Navigation
//
//  Created by Keto Nioradze on 28.10.23.
//
import UIKit

class ColorPaletteViewController: UIViewController {
    
    var delegate: HomeViewController?
    
    // MARK: Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: SetUp Content
    private func setupLayout() {
        view.backgroundColor = .white
        
        let changeButtonBackgroundColorLabel = UILabel()
        changeButtonBackgroundColorLabel.text = "Change Home Buttons Background Colours"
        changeButtonBackgroundColorLabel.textAlignment = .center
        let buttonColorsStack = createColorStack(target: #selector(changeButtonColorPressed))
        
        let changeViewBackgroundColorLabel = UILabel()
        changeViewBackgroundColorLabel.text = "Change Home Background Colour"
        changeViewBackgroundColorLabel.textAlignment = .center
        let viewColorsStack = createColorStack(target: #selector(changeViewColorPressed))
        
        let mainStack = UIStackView(arrangedSubviews: [changeButtonBackgroundColorLabel, buttonColorsStack, changeViewBackgroundColorLabel, viewColorsStack])
        mainStack.axis = .vertical
        mainStack.spacing = 15
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: Colors StackView
    private func createColorStack(target: Selector) -> UIStackView {
        let colours: [UIColor] = [.red, .green, .blue, .yellow, .purple, .orange]
        var buttons: [UIButton] = []
        
        for colour in colours {
            let button = UIButton()
            button.backgroundColor = colour
            button.widthAnchor.constraint(equalToConstant: 50).isActive = true
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            button.addTarget(self, action: target, for: .touchUpInside)
            buttons.append(button)
        }
        
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    // MARK: Change Button Collor
    @objc func changeButtonColorPressed(sender: UIButton) {
        guard let colour = sender.backgroundColor else { return }
        delegate?.changeButtonBackgroundColor(to: colour)
        if navigationController != nil {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: Change View Color
    @objc func changeViewColorPressed(sender: UIButton) {
        guard let colour = sender.backgroundColor else { return }
        delegate?.changeViewBackgroundColor(to: colour)
        if navigationController != nil {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
