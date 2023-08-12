# Postmortem

## Postmortem 




## Server Downtime Incident Report
Due to an increasing number of users and daily visits and subscribers, there has been an increase in the number of users on our price comparison site, which in turn caused the server to crash as it doesn't have enough disk space to accommodate so many users  hence the downtime error prompt. we understand the effect it had on wholesalers and retailers and even the site users hence the reason for this incident report as a form of public apology.




## Issue Summary
From 10:30 am to 12:50 pm WAT, users who tried accessing the e-commerce (price beta) website received a downtime error response message. Numerous activities could have been halted during that period, at its peak user frustration and profitability or the generation of revenue on the retailer and wholesale whose products are being displayed on the site may have lost potential product sales at that time, and who knows whether a particular user of the app wanted to show his friend or bragged about a site that eases the stress of shoppers and gives the best deals at that point?.  The root cause of this outage was a simple software glitch and incorrect configuration setting.
Timeline(West African Time)
10:15 AM - configuration is being pushed 
10:30 AM - outage starts 
10:30 AM - pagers alerted teams 
11:15 AM  - failed configuration fix
12:10  PM- successful configuration rollback
12:12  PM - server restarts 
12:50 PM  - the site is 100% back online 

## Root Cause
At 10:15 AM an additional feature was being deployed to the web server without being tested and some errors were inadvertently overlooked. The change specified an invalid address for the authentication servers in production. This exposed a bug in the authentication libraries which caused them to block permanently while attempting to resolve the invalid address to physical services. in addition, the internal monitoring systems are permanently blocked on this call to the authentication library. The combination of the bug and configuration error quickly caused all of the serving threads to be consumed. Traffic was permanently queued waiting for a serving thread to become available. The servers began repeatedly hanging and restarting as they attempted to recover and at 10:30 AM WAT, the service outage began.

## Resolution and Recovery
At 10:30 AM WAT, the monitoring systems alerted our engineers who investigated and quickly escalated the issue. By 10:30 AM, the incident response team identified that the monitoring system was exacerbating the problem caused by this bug.
At 11:15 AM, an attempt to roll back the problematic configuration change was made. This rollback failed due to complexity in the configuration system which caused our security checks to reject the rollback. These problems were addressed and were successfully rolled back at 12:10  PM.
Users stated ginning access to the site, and we determined that the overall recovery would be faster by a restart. To help with the recovery, we turned off some of our monitoring systems which were triggering the bug. As a result, we decided to restart servers gradually (at 12:12  PM), to avoid possible cascading failures from a wide-scale restart. 12:50 the site was 100% back online.

## Corrective and Preventative Measures







* Disable the current configuration release mechanism until safer measures are implemented. (Completed.)
* Change the rollback process to be quicker and more robust.
* Fix the underlying authentication libraries and monitoring to correctly timeout/interrupt errors.
* Programmatically enforce staged rollouts of all configuration changes.
* Improve the process for auditing all high-risk configuration options.
* Add a faster rollback mechanism and improve the traffic ramp-up process, so any future problems of this type can be corrected quickly.
* Develop a better mechanism for quickly delivering status notifications during incidents.

![Alt thank you](https://www.shutterstock.com/image-vector/thank-you-hand-drawn-lettering-260nw-780491263.jpg)


