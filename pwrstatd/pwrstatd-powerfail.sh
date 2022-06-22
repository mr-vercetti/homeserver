#!/bin/bash
echo "Warning: Utility power failure has occurred for a while, system is now powered by UPS" | wall

# Enable to send email
enable_email="yes"

# Send email using "/etc/sg-send-mail.sh" script
email_from=""
email_to=""
email_sender=""

if [[ $enable_email == "yes" ]]; then
        /etc/sg-send-email.sh -f ${email_from} -n ${email_sender} -t ${email_to} -s "Power failure on hustler'" -m "$(date)"
fi
