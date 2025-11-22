# BountyForge — Professional Recon Environment Installer

BountyForge is a professional-grade installer designed to build a complete reconnaissance environment for Bug Bounty Hunters, Red Team operators, and cybersecurity professionals.  
It automates the installation of essential dependencies, offensive security tools, and Go-based reconnaissance utilities, ensuring a fully functional, stable, and reproducible setup on Kali Linux.

---

## ✨ Features

### 🔧 Automated Environment Setup
- Installs base dependencies:
  - Go, Python3, Ruby, build-essential, make, etc.
- Configures **GOPATH** and **GOBIN** with correct permissions.
- Exports paths without overwriting user profiles.

### 🕵️ Recon Tools (Go)
- subfinder  
- httpx  
- nuclei  
- naabu  
- chaos  
- ffuf  
- gau  
- hakrawler  
- waybackurls  
- assetfinder  
- meg  
- httprobe  
- ksubdomain  

### 🛠️ Offensive Tools
- Nikto  
- SQLMap  
- WPScan  

### 🔗 System Integration
- Symlinks all installed binaries to `/usr/local/bin`

### 📄 Final Summary
- List of installed tools  
- Failed Go builds  
- Next steps and environment setup  

---

## 📦 Installation

```bash
git clone https://github.com/<tu_usuario>/BountyForge.git
cd BountyForge
chmod +x bountyforge.sh
sudo ./bountyforge.sh

📁 Structure

BountyForge/
│── bountyforge.sh
│── README.md
└── LICENSE


🧱 Requirements

Kali Linux

sudo/root permissions

Internet connection

🛡️ Legal Disclaimer

This tool is intended strictly for legal security assessments, research, and education.
The author is not responsible for misuse or damage caused by using this software.

👤 Author

Hacking Team
Bug Bounty Hunter · Pentester · Cybersecurity Researcher

📜 3. LICENSE (MIT)

MIT License

Copyright (c) 2025 Hacking Team

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

Nuestras RRSS

Telegram

https://t.me/PlantillasNucleiHackingTeam
https://t.me/HackingTeamGrupoOfficial
https://t.me/+0hHSaKO7eI9mNWY8 Hacking Team Difusion
https://t.me/+llcmNGzz6JIyMmI0 Biblioteca
https://t.me/TermuxHackingTeam

X

@HackingTeam777

Bluesky

https://bsky.app/profile/hackingteam.bsky.social

Discord

https://discord.gg/V4nPFbQX

Facebook 

https://www.facebook.com/groups/hackingteam2022/?ref=share
https://www.facebook.com/groups/HackingTeamCyber/?ref=share

Youtube 

https://www.youtube.com/@HackingTeamOfficial

Canal de tiktok 

https://www.tiktok.com/@hacking.kdea?_t=ZS-8vTtlaQrDTL&_r=1

#hackingteam #cibersecurity #infosec #eticalhacking #pentesting #dns #script #cracking #hack #security #bugbounty #payload #tools #exploit #cors #sqli #ssrf #python #c2 #poc #web #ramsomware #phishing #linux #osint #linux #windows #redteam #blueteam #spyware #digitalforensics #reverseengineeringtools #rat #malwareforensics #exploitdevelopment #sandboxing #apt #zerodayexploit #xss #github #cve #java #tools #termux #troyano    #dev #sqlmap #waybackurls #copilot #ai #ia #kalilinux #parrot #dracos #susse #nessus #oswazap #burpsuite #wireguar
