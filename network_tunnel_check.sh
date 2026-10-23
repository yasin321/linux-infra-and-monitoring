#!/bin/bash
# Multi-Server Tunnel Connectivity & Latency Monitor

TARGET_IP="10.10.0.1" # Upstream Tunnel Gateway
PING_COUNT=4

echo "Checking tunnel connectivity to $TARGET_IP..."

if ping -c $PING_COUNT $TARGET_IP > /dev/null 2>&1; then
    LATENCY=$(ping -c 1 $TARGET_IP | awk -F'/' 'END {print $5}')
    echo "[OK] Tunnel is UP. Average Latency: ${LATENCY} ms"
else
    echo "[CRITICAL] Tunnel is DOWN! Restarting network interface..."
    # systemctl restart wg-quick@wg0
fi
