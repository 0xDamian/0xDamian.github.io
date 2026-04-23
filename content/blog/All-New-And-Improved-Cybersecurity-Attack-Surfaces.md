---
title: All New and Improved Cybersecurity...Attack Surfaces?
date: 2026-04-22
draft: false
tags:
  - blog
  - cybersecurity
  - tech
  - hacking
  - linux
  - AI
author: 0xDamian
cover:
  image: /blog/All-New-And-Improved-Cybersecurity-Attack-Surfaces/banner.jpg
---
Since the generative AI boom, everyone has found a use case for it. Reviewing their writing, planning a study guide, sharing hard-coded API keys/company secrets critical to their organisation's infrastructure, and even using it as a financial adviser.
What? The whole sharing company secrets thing? Pfft. Oh yeah, people do it all the time.

[Samsung employees unwittingly leaked company secret data by using ChatGPT](https://securityaffairs.com/144597/security/samsung-data-leak-chatgpt.html#:~:text=%E2%80%9CIn%20another%20case%2C%20an%20employee,Affairs%20as%20your%20favorite%20blog.). They shared information like meeting documents and source code with chatGPT. This led to 3 data leaks in just under a month via chatGPT.
How about the [12,000+ API Keys and Passwords Found in Public Datasets Used for LLM Training](https://thehackernews.com/2025/02/12000-api-keys-and-passwords-found-in.html)? There were 219 different types of secrets found here. AWS root keys, Slack webhooks, Mailchimp API keys, name it. A lot of these were live, too.

## So...What Does This Mean?

See, these free tiers from AI providers use data from their free tiers to train their AI models. While you can opt out of it, it comes with an inconvenient trade-off: you lose your chat history. I reckon most people would rather not lose their chat history, which is a huge part of how we got here and by here, I mean an entirely new attack surface.  
Before all this, leaking company secrets required social engineering humans; now we social engineer AI. We might not even need to do that. A simple prompt asking an AI chatbot to put a dummy API key as an example in your code might suffice. There's a good chance it gives you a live API key. But that's just surface level.

How about targeting specific organisations? Annoying nerds with computers (black hat hackers) may already be doing this. I personally don't know for sure, but it's up to annoying nerds with computers and ethics (Cybersecurity professionals) to research this extensively.  
What would the prompts to achieve this even look like? What guardrails should AI providers put in place to protect businesses? Are compliance and regulatory protocols enough?

I'm excited to see what the future of AI-induced attack surfaces would look like as the technology (and others) advances.

