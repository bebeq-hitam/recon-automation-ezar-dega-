#!/bin/bash

# --- File Paths ---
INPUT="../input/domains.txt"
ALL_SUB="../output/all-subdomains.txt"
LIVE_OUT="../output/live.txt"
LOG_PROG="../logs/progress.log"
LOG_ERR="../logs/errors.log"

# Bikin folder kalo belum ada biar gak error 
mkdir -p ../output ../logs

echo "[$(date)] --- START RECON MISSION ---" | tee -a $LOG_PROG

# 1. Baca tiap domain di file input
while read -r domain; do
    echo "[$(date)] Stalking domain: $domain" | tee -a $LOG_PROG
    
    # 2. Cari subdomain pake subfinder
    # Hasilnya langsung disaring 'anew' biar gak double 
    subfinder -d "$domain" -silent 2>>$LOG_ERR | anew $ALL_SUB | tee -a $LOG_PROG
    
done < "$INPUT"

# 3. Cek mana yang masih hidup (Live Hosts) pake httpx 
echo "[$(date)] Checking for live targets..." | tee -a $LOG_PROG
cat $ALL_SUB | httpx -silent -title -status-code 2>>$LOG_ERR | anew $LIVE_OUT

echo "[$(date)] --- MISSION ACCOMPLISHED ---" | tee -a $LOG_PROG
echo "Total Unique Subdomains: $(wc -l < $ALL_SUB)"
echo "Total Live Hosts: $(wc -l < $LIVE_OUT)"

