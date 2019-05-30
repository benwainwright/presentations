---
author: Ben Wainwright
title: The Art of the SLO - Playback
---

# What is an SLI?
> Principled way of arguing about the reliability of the service

# What is an SLI?
- **Service Level Indicator**
- Defining reliability in terms of _things that users care about_


# What should you measure
- Don't overdo it
- Ideally two or three SLOs per user Journey
- Group them if there are a number of similar journeys

# What should you measure 
- We are request/response based systems (as opposed to data stores/processing
    pipelines)
- The "Holy trinity" is availability, latency and throughput
- Perhaps correctness?

# Correctness?
- Correctness is **hard**
- More or less appropriate depending on the service:
   - Payment providers need to get this right
   - Not so much search results

# What is an SLI?
- Ratio of GOOD events to all valid events 

  ```
  SLI = (good_events / all_valid_events) * 100
  ```

# What is an SLI?
## Example
**99.1%** SLI performance

  ```
  all_valid_events = 784
  good_events = 777

  (good_events / all_valid_events) * 100 = 99.1071429
  ```

# Defining SLIS
## What is a good event?
- A good event is an event that will make users happy!

# Defining SLIS
## What makes users happy?
- Use data where possible, e.g:
   - Previous experience
   - Questionnaires
   - Research
   - Twitter

# Defining SLIS
## Example - Latency
- Will users be happy with a **5 second** page load?
- What about **2 seconds**?
- What about **0.5 second**?

> **Proportion of requests that take 0.5 seconds vs all requests**

# Defining SLIS
## What is a valid event?
- Exclude particular classes of events...
- Do we care about every request?
- e.g. for the current slice, do we care about POST requests?

> **Proportion of `GET` requests that take under 0.5 seconds vs all requests**

# SLI performance
- SLI performance should be evaluated over a set window
- e.g. 28 days sliding window

>**Over the last 28 days, we have had 777 good events out of 784 events.
    Therefore our current SLI performance is 99.1%**

# What is an SLO
- Service Level Objective
- NOT the same as a Service Level Agreement (SLA)
  - If you miss your SLO, your users start to get **unhappy**
  - If you miss your SLA, you start giving **refunds**

# Choosing an objective (SLO)
- Try to pick a figure at which customers will start to
    become unhappy
- Measure current performance and try to be **slightly** over - "barely met"
- Alternatively pick "aspirational" SLOs that you might not meet straight away

# Choosing an objective (SLO)
- If you EXCEED an SLO, people will anchor on it, and that will be their
    expectation
- e.g. **Change** of latency is important. If its always been slow, its fine. If you make
    it fast, don't make it slow again

# Error budgets
- Provides a clear way of identifying how **reliable** your service is allowed to
    be over a given period
- the margin between **100%** and **your SLO** is your error budget 
- If your SLO is **99.5%** your error budget is therefore **0.5%**

# Error budgets
## Example

    SLO = 99.5
    error_budget = 100 - SLO
    all_valid_events = 81241
    bad_events = 120

    (all_valid_events / 100) * error_budget ~= 406
    (bad_events / 406) * 100 ~= 29.5

> We have spent **29.5%** of our error budget

# Responding to Error budgets
- We should monitor our SLO performance/Error budget performance continuously to
    take action before we miss the threshold
- As we progress through our Error budget we may want to adjust Engineering
    priorities accordingly

# Error budgets
## Budget is spent
- Engineering teams should stop or reduce feature development
- Instead there should be a focus on reliability work
- e.g. Pick a post-mortem action from the backlog

# Error budgets
## Plenty Left
- **SPEND IT! INNOVATE! TAKE RISKS! GO CRAZY!**
- Part of the role of SRE would be to shepherd this

# Evaluating SLIs
- SLIs should be measured against external indicators. E.g. twitter, support
    tickets etc.
- They should be a true reflection of user happiness. If you miss an SLO target
    and USERS DON'T NOTICE, its probably wrong!
- Post mortems should be looking at the impact the event had on the SLO/SLI and
    whether the event really had user impact

# Implications
- Not necessarilly alarming on internal metrics like CPU usage, disk space etc
- Not necessarilly responding to all 500s/availability issues/outages
  - ... But having the information there when alerts DO happen

# Need extra help?
- If we run into problems Google have offered to spend at least **one hour**
    with us reviewing our SLOs/SLIs
- cre-slo-review@google.com
- Need to provide a **service diagram** and **user journeys**

# The End

Any Questions?
