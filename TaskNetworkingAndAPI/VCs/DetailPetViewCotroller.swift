//
//  DetailPetViewCotroller.swift
//  TaskNetworkingAndAPI
//
//  Created by Saleh Bin Essa on 04/03/2024.
//

import Foundation

import Foundation

import UIKit
import SnapKit
import Kingfisher

class DetailPetViewController: UIViewController {
    // Property to hold the bank account details passed from the previous view
    var pet: Pet?

    // UI Components
    private let petIdLabel = UILabel()
    private let petNameLabel = UILabel()
    private let adoptionStatusLabel = UILabel()
    private let petAgeLabel = UILabel()
    private let petGenderLabel = UILabel()
    
    let petImageView = UIImageView()
    let url = URL(string: "https://example.com/image.png")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        configureWithStudent()
    }

    private func setupViews() {
        view.backgroundColor = .white

        petNameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        petAgeLabel.font = .systemFont(ofSize: 16, weight: .medium)
        petGenderLabel.font = .systemFont(ofSize: 16, weight: .medium)
        adoptionStatusLabel.font = .systemFont(ofSize: 16, weight: .medium)
        petImageView.kf.setImage(with: URL(string: pet?.image ?? "image"))


        // Add the views to the hierarchy
        view.addSubview(petNameLabel)
        view.addSubview(petAgeLabel)
        view.addSubview(petGenderLabel)
        view.addSubview(adoptionStatusLabel)
        view.addSubview(petImageView)
    }

    private func setupLayout() {
        petImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)  // Example size, adjust as needed
        }

        petNameLabel.snp.makeConstraints { make in
            make.top.equalTo(petImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        petAgeLabel.snp.makeConstraints { make in
            make.top.equalTo(petNameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        petGenderLabel.snp.makeConstraints { make in
            make.top.equalTo(petAgeLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        adoptionStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(petGenderLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }

    private func configureWithStudent() {
        petNameLabel.text = "Pet Name: \(pet?.name ?? "name")"
        petAgeLabel.text = "Age: \(pet?.age ?? 0)"
        petGenderLabel.text = "Gender: \(pet?.gender ?? "gender")"
        petAgeLabel.text = "Adoption Status: \(pet?.adopted ?? true)"
      petImageView.image = UIImage(named: pet?.image ?? "image")
    }
}
