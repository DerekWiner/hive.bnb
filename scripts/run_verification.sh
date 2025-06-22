#!/bin/bash
# hive.bnb/scripts/run_verification.sh
# Executes Hive.bnb NFT interoperability logic

set -e

echo "🔍 Running Waggle anchor check..."
./validate_waggle.sh

# Optional: Kernel hash re-check (copy validate_kernel.py if needed)
# echo "🔍 Running Kernel69 validation..."
# python3 validate_kernel.py

# Future: agent registry sync check
# echo "📡 Syncing registered agents..."

echo "✨ Hive.bnb validation complete. Anchor links verified."
