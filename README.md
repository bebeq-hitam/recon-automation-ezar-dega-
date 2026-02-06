# Automated Reconnaissance Script

**Author:** Ezar Dega Auffa 
**Date:** February 2026

## 📋 Overview
This project provides a Bash script designed to automate the initial reconnaissance phase of a penetration test or Bug Bounty assessment. It streamlines the process of subdomain enumeration and validation by chaining together industry-standard tools.

The script performs the following actions:
1.  **Enumeration:** Identifies subdomains associated with a target root domain.
2.  **Filter:** Removes duplicate entries to ensure a clean dataset.
3.  **Probing:** Validates active HTTP/HTTPS services on the discovered subdomains.

## ⚙️ Prerequisites
Ensure the following dependencies are installed and configured in your system `PATH` before running the script:

* **Go (Golang):** Required to install and run the scanning tools.
* **Subfinder:** Used for passive subdomain discovery.
* **Anew:** Used for appending unique lines to files.
* **Httpx:** Used for multi-purpose HTTP toolkit and probing.

### Installation of Dependencies
Execute the following commands in your terminal:
```bash
go install -v [github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest](https://github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest)
go install -v [github.com/tomnomnom/anew@latest](https://github.com/tomnomnom/anew@latest)
go install -v [github.com/projectdiscovery/httpx/cmd/httpx@latest](https://github.com/projectdiscovery/httpx/cmd/httpx@latest)
