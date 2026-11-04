<div align="center">

# 🩸 BloodBot
### AI-Powered Blood Availability System

**Connecting blood donors with patients through intelligent technology.**

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&height=180&section=header&text=BloodBot&fontSize=50&fontColor=ffffff&desc=AI-Powered%20Blood%20Availability%20System&descSize=18" width="100%" />

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Machine Learning](https://img.shields.io/badge/Machine%20Learning-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)

</div>

---

## 📌 Overview

BloodBot is an AI-powered blood availability system designed to simplify and improve the process of finding suitable blood donors during medical emergencies.

Traditional blood bank systems often face challenges such as delayed donor identification, disconnected records, and limited communication between donors and patients.

BloodBot aims to address these challenges through a centralized platform that combines artificial intelligence, machine learning, database management, and location-based services.

The system helps identify potential donors based on blood group compatibility, availability, location, and priority factors, making the donor-search process more efficient.

## 🎯 Problem Statement

Finding suitable blood donors during emergencies can be difficult because of:

- Delays in identifying compatible blood donors.
- Lack of centralized and updated donor information.
- Limited communication between patients and donors.
- Difficulty locating nearby available donors.
- Manual donor-search processes.
- Challenges in prioritizing urgent blood requests.

BloodBot aims to reduce these difficulties by providing an intelligent and organized blood availability platform.

## ✨ Key Features

- **Intelligent Donor Matching:** Identifies potential donors using blood group compatibility and other relevant factors.
- **Location-Based Search:** Helps identify donors based on their geographical location.
- **Donor Availability Management:** Maintains donor availability information.
- **Priority-Based Matching:** Uses multiple factors to prioritize potential donor matches.
- **Centralized Database:** Organizes donor and blood request information.
- **Emergency Blood Requests:** Supports the submission and management of urgent blood requests.
- **Notifications:** Supports communication with potential donors through notification services.
- **User-Friendly Interface:** Provides an accessible platform for patients and donors.

## 🏗️ System Architecture

BloodBot follows a layered architecture consisting of three major components.

### 1. Presentation Layer
- Flutter-based user interface.
- Patient and donor interaction.
- Blood request submission.
- Donor information display.

### 2. Application Layer
- Flask backend.
- Donor matching and prioritization logic.
- Blood group compatibility checking.
- Location-based donor search.
- Machine learning integration.

### 3. Data Layer
- MySQL database.
- Donor information management.
- Blood request records.
- Availability information.
- User data management.

### Architecture Diagram

```text
          ┌───────────────────────────┐
          │       USER INTERFACE      │
          │                           │
          │     Flutter Application   │
          │                           │
          └─────────────┬─────────────┘
                        │
                        ▼
          ┌───────────────────────────┐
          │      APPLICATION LAYER    │
          │                           │
          │      Flask Backend        │
          │                           │
          │  • Donor Matching         │
          │  • Priority Calculation   │
          │  • Blood Compatibility    │
          │  • Location-Based Search  │
          │  • ML Integration         │
          └─────────────┬─────────────┘
                        │
                        ▼
          ┌───────────────────────────┐
          │        DATA LAYER         │
          │                           │
          │      MySQL Database       │
          │                           │
          │  • Donor Records          │
          │  • Patient Information    │
          │  • Blood Requests         │
          │  • Availability Details   │
          └───────────────────────────┘
```

## 🤖 Intelligent Blood Donor Matching Algorithm (IBDMA)

BloodBot uses the concept of an Intelligent Blood Donor Matching Algorithm (IBDMA) to prioritize potential donors.

The algorithm considers multiple parameters to identify suitable candidates.

### Matching Parameters

| Parameter | Description |
|---|---|
| Blood Group Compatibility | Checks whether the donor's blood group is compatible with the recipient. |
| Location | Considers the distance between donor and patient. |
| Availability | Checks whether the donor is currently available. |
| Urgency | Considers the priority of the blood request. |
| Donation History | Considers relevant previous donation information. |

### Weighted Priority Formula

The donor priority score can be represented as:

```text
Priority Score =
(W1 × Compatibility Score) +
(W2 × Location Score) +
(W3 × Availability Score) +
(W4 × Urgency Score) +
(W5 × Donation History Score)
```

Where:

- `W1` = Weight assigned to blood compatibility.
- `W2` = Weight assigned to location.
- `W3` = Weight assigned to donor availability.
- `W4` = Weight assigned to request urgency.
- `W5` = Weight assigned to donation history.

The weights determine the contribution of each factor to the overall priority score.

**Important:** Blood group compatibility and medical eligibility must be treated as mandatory checks, not overridden by a high priority score. Final donor suitability must be confirmed by qualified medical professionals.

## 🛠️ Technology Stack

| Category | Technologies |
|---|---|
| Programming Language | Python |
| Frontend | Flutter |
| Backend | Flask |
| Database | MySQL |
| Machine Learning | Scikit-learn |
| Maps and Location | Google Maps API, Geopy |
| Notifications | Firebase Cloud Messaging |
| Conversational Interface | Dialogflow |

## 💻 Hardware Requirements

- Computer or laptop.
- Minimum 4 GB RAM.
- Minimum 256 GB storage.
- Internet connectivity.
- Android smartphone for mobile application access.

## ⚙️ Software Requirements

- Python.
- Flutter SDK.
- Flask.
- MySQL Server.
- Scikit-learn.
- Google Maps API.
- Geopy.
- Firebase Cloud Messaging.
- Dialogflow.
- Visual Studio Code or another suitable development environment.

## 🌍 Applications

BloodBot can be useful in several healthcare-related scenarios:

- Emergency blood donor identification.
- Hospital and blood bank coordination.
- Blood donation organizations.
- Community-based donor networks.
- Medical emergency support systems.
- Blood availability information management.

## 🚀 Advantages

- Reduces manual effort in searching for donors.
- Helps identify potential donors efficiently.
- Supports location-based donor discovery.
- Organizes donor information centrally.
- Improves communication between patients and donors.
- Supports priority-based blood request management.
- Provides a scalable foundation for intelligent healthcare applications.

## ⚠️ Limitations

- Requires accurate and regularly updated donor information.
- Depends on internet connectivity for online operations.
- Donor availability may change unexpectedly.
- Location accuracy depends on available location services.
- Blood compatibility and medical suitability require professional verification.
- The effectiveness of matching depends on the quality of available data.

## 🔮 Future Scope

BloodBot can be enhanced with additional capabilities, including:

- Advanced machine learning models for improved donor matching.
- Integration with hospital and blood bank management systems.
- Real-time blood stock availability.
- Improved emergency notification services.
- Multilingual chatbot support.
- Advanced analytics and reporting.
- Expansion to support a larger network of hospitals and donors.
- Enhanced security and privacy mechanisms for sensitive user information.

## 🤝 Contribution

Contributions and suggestions are welcome!

If you would like to improve this project:

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Commit your changes.
5. Submit a pull request.

## 📁 Project Information

| Detail | Description |
|---|---|
| Project Name | BloodBot |
| Project Title | AI-Powered Blood Availability System |
| Domain | Artificial Intelligence and Healthcare |
| Backend | Flask |
| Frontend | Flutter |
| Database | MySQL |
| Algorithm | Intelligent Blood Donor Matching Algorithm (IBDMA) |

---

<div align="center">

### ❤️ Our Vision

**Making blood availability smarter, faster, and more accessible through technology.**

*Every donor matters. Every second counts. Every life matters.*

</div>