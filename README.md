<div align="center">

<img src="https://capsule-render.vercel.app/api?type=wave&color=0:8B0000,50:DC2626,100:FF6B6B&height=230&section=header&text=BloodBot&fontSize=65&fontColor=ffffff&fontAlignY=38&desc=AI-Powered%20Blood%20Availability%20System&descSize=19&descAlignY=62&animation=fadeIn" width="100%"/>

# 🩸 AI-Powered Blood Availability System

### Connecting Blood Donors with Patients Through Intelligent Technology

<p>
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"/>
<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
<img src="https://img.shields.io/badge/Flask-222222?style=for-the-badge&logo=flask&logoColor=white"/>
<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white"/>
</p>

<p>
<img src="https://img.shields.io/badge/Machine%20Learning-FF6F00?style=flat-square"/>
<img src="https://img.shields.io/badge/Healthcare%20Technology-DC2626?style=flat-square"/>
<img src="https://img.shields.io/badge/REST%20API-00897B?style=flat-square"/>
</p>

<a href="https://github.com/Rafiqua-9Sultana/ai-powered-blood-availability-system">
<img src="https://img.shields.io/badge/View%20Repository-181717?style=for-the-badge&logo=github&logoColor=white"/>
</a>

</div>

---

## 🔴 01. Project Overview

**AI-Powered Blood Availability System (BloodBot)** is an intelligent healthcare platform designed to simplify blood donor discovery and improve access to blood availability information.

The system aims to connect patients with potential blood donors through intelligent matching, geographical location analysis, donor availability information, and priority-based searching.

By combining artificial intelligence, machine learning, database management, and location-based services, the platform aims to make the blood donation process more organized and accessible.

## 🎯 02. Problem Statement

Finding suitable blood donors during medical emergencies can be challenging due to:

- Delays in identifying compatible blood donors.
- Lack of centralized and updated donor information.
- Limited communication between patients and donors.
- Difficulty locating nearby available donors.
- Manual donor-search and prioritization processes.

**Our Approach:** Develop a centralized and intelligent platform that simplifies donor discovery and supports efficient blood request management.

## ✨ 03. Key Features

<table>
<tr>
<td width="50%" valign="top">

### 🩸 Intelligent Donor Matching
Identifies potential donors using blood group compatibility and relevant matching parameters.

### 📍 Location-Based Search
Helps discover potential donors based on geographical proximity.

### 👥 Donor Management
Maintains donor profiles and availability information.

### ⚡ Priority-Based Matching
Ranks potential donors according to relevant priority factors.

</td>
<td width="50%" valign="top">

### 🏥 Blood Availability
Supports blood availability and inventory information management.

### 🚨 Emergency Requests
Supports urgent blood request submission and management.

### 🔔 Notifications
Supports communication with potential donors through notification services.

### 🤖 Chatbot Assistance
Provides a conversational interface for blood availability and donation-related queries.

</td>
</tr>
</table>

## 🏗️ 04. System Architecture

The application follows a layered architecture consisting of three major components.

| Layer | Responsibility |
|---|---|
| Presentation Layer | Flutter interface, patient interaction, donor profiles and blood requests |
| Application Layer | Flask backend, donor matching, prioritization and API processing |
| Data Layer | MySQL database, donor records, blood requests and availability information |

### Architecture Diagram

```mermaid
flowchart TD
    A["👤 Patients & Donors"] --> B["Flutter Application"]

    B --> C["Flask Backend"]

    C --> D["REST API Layer"]

    D --> E["Donor Matching Engine"]
    D --> F["Blood Request Management"]
    D --> G["Location Services"]
    D --> H["Chatbot Services"]

    E --> I["MySQL Database"]
    F --> I
    G --> I

    C --> J["Notification Services"]

    I --> C
    C --> B
```

## 🤖 05. Intelligent Blood Donor Matching Algorithm (IBDMA)

The system incorporates the concept of an **Intelligent Blood Donor Matching Algorithm (IBDMA)** to identify and prioritize potential donors.

The matching approach considers multiple parameters:

### Matching Parameters

| Parameter | Description |
|---|---|
| Blood Group Compatibility | Checks compatibility between donor and recipient blood groups. |
| Geographical Location | Considers the distance between the donor and patient. |
| Donor Availability | Evaluates the donor's current availability. |
| Request Urgency | Considers the priority of the blood request. |
| Donation History | Considers relevant previous donation information. |

### Weighted Priority Formula

```text
Priority Score =

(W1 × Compatibility Score) +
(W2 × Location Score) +
(W3 × Availability Score) +
(W4 × Urgency Score) +
(W5 × Donation History Score)
```

Where each weight represents the contribution of its corresponding parameter.

**Important:** Blood group compatibility and medical eligibility must be mandatory checks, not factors that can be overridden by a high priority score. Final donor suitability and crossmatching must be verified by qualified healthcare professionals.

## 🛠️ 06. Technology Stack

<table>
<tr>
<th>Category</th>
<th>Technologies</th>
</tr>
<tr>
<td><b>Programming Language</b></td>
<td>Python</td>
</tr>
<tr>
<td><b>Frontend</b></td>
<td>Flutter, Dart</td>
</tr>
<tr>
<td><b>Backend</b></td>
<td>Flask</td>
</tr>
<tr>
<td><b>Database</b></td>
<td>MySQL</td>
</tr>
<tr>
<td><b>Machine Learning</b></td>
<td>Scikit-learn</td>
</tr>
<tr>
<td><b>Maps & Location</b></td>
<td>Google Maps API, Geopy</td>
</tr>
<tr>
<td><b>Notifications</b></td>
<td>Firebase Cloud Messaging</td>
</tr>
<tr>
<td><b>Conversational Interface</b></td>
<td>Dialogflow</td>
</tr>
<tr>
<td><b>Development Environment</b></td>
<td>Visual Studio Code</td>
</tr>
<tr>
<td><b>Version Control</b></td>
<td>Git, GitHub</td>
</tr>
</table>

## 🔄 07. Application Workflow

```mermaid
flowchart TD
    A([Start]) --> B["User Registration"]
    B --> C["Enter Blood Requirements"]
    C --> D["Search for Donors"]
    D --> E["Blood Group Compatibility Check"]
    E --> F["Location-Based Filtering"]
    F --> G["Donor Availability Check"]
    G --> H["Priority-Based Ranking"]
    H --> I["Display Potential Donors"]
    I --> J["Contact Potential Donor"]
    J --> K([End])
```

## 💻 08. System Requirements

### Hardware Requirements

- Computer or laptop.
- Minimum 4 GB RAM.
- Minimum 256 GB storage.
- Internet connectivity.
- Android smartphone for mobile application access.

### Software Requirements

- Python 3.10 or later.
- Flutter SDK.
- Flask.
- MySQL Server.
- Scikit-learn.
- Google Maps API.
- Geopy.
- Visual Studio Code.
- Git.

## 🌍 09. Applications

- Emergency blood donor identification.
- Hospital and blood bank coordination.
- Blood donation organizations.
- Community-based donor networks.
- Medical emergency support systems.
- Blood availability information management.

## 📊 10. Advantages

| Advantage | Benefit |
|---|---|
| Reduced Manual Effort | Simplifies the donor-search process. |
| Intelligent Matching | Helps identify relevant potential donors. |
| Location-Based Discovery | Supports nearby donor identification. |
| Centralized Information | Organizes donor and request records. |
| Better Communication | Supports interaction between patients and donors. |
| Priority Management | Helps organize urgent blood requests. |

## ⚠️ 11. Limitations

- Requires accurate and regularly updated donor information.
- Depends on internet connectivity for online operations.
- Donor availability may change unexpectedly.
- Location accuracy depends on available location services.
- Blood compatibility requires professional verification.
- Matching effectiveness depends on the quality of available data.

## 🔮 12. Future Scope

- Advanced machine learning models for donor recommendations.
- Integration with hospital and blood bank management systems.
- Real-time blood stock availability.
- Improved emergency notification services.
- Multilingual chatbot support.
- Advanced analytics and reporting dashboard.
- Enhanced security and privacy mechanisms.
- Expansion to a larger network of hospitals and donors.

## 🤝 13. Contributions

Contributions, suggestions, and improvements are welcome!

1. Fork this repository.
2. Create a new branch.
3. Make your changes.
4. Commit your changes.
5. Submit a pull request.

## 📁 14. Project Information

| Detail | Description |
|---|---|
| Project Name | AI-Powered Blood Availability System |
| Product Identity | BloodBot |
| Domain | Artificial Intelligence & Healthcare |
| Frontend | Flutter |
| Backend | Python Flask |
| Database | MySQL |
| Matching Approach | Intelligent Blood Donor Matching Algorithm (IBDMA) |
| Repository | GitHub |

---

<div align="center">

## ❤️ Our Vision

### Making blood availability smarter, faster, and more accessible through technology.

**Every donor matters. Every second counts. Every life matters.**

<br/>

<a href="https://github.com/Rafiqua-9Sultana">
<img src="https://img.shields.io/badge/GitHub-Rafiqua%20Sultana-181717?style=for-the-badge&logo=github"/>
</a>

<a href="https://www.linkedin.com/in/rafiqua-sultana-a03270252">
<img src="https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin"/>
</a>

<br/><br/>

⭐ **If you find this project interesting, consider giving it a star!**

<img src="https://capsule-render.vercel.app/api?type=wave&color=0:8B0000,50:DC2626,100:FF6B6B&height=110&section=footer" width="100%"/>

</div>