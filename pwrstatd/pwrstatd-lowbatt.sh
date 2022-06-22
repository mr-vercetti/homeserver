#!/bin/bash
echo "Warning: The UPS's battery power is not enough, system will be shutdown soon!" | wall

# Enable to send email
enable_email="yes"

# Send email using "/etc/sg-send-mail.sh" script
email_from=""
email_to=""
email_sender=""

if [[ $enable_email == "yes" ]]; then
        /etc/sg-send-email.sh -f ${email_from} -n ${email_sender} -t ${email_to} -s "UPS's battery running low'" -m "$(date)"
fi
