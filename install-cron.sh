#!/bin/bash
# Install AI Daily Digest Cron Job
# Run this script manually to add the cron job

CRON_JOB="0 7 * * * export PATH=\"\$HOME/.bun/bin:\$PATH\" && cd /Users/dannyocr2/.openclaw/danny_mind/Projects/ai-daily-digest && bun scripts/digest.ts --hours 48 --top-n 15 --lang zh --output /Users/dannyocr2/.openclaw/danny_mind/Inbox/_sources/digest-\$(date +\\%Y\\%m\\%d).md >> /Users/dannyocr2/.openclaw/logs/digest-\$(date +\\%Y\\%m\\%d).log 2>&1"

# Get current crontab
CURRENT_CRON=$(crontab -l 2>/dev/null || echo "")

# Add new cron job
echo "$CURRENT_CRON" | { cat; echo "$CRON_JOB"; } | crontab -

# Verify
echo "✅ Cron job added!"
echo ""
echo "Current crontab:"
crontab -l
