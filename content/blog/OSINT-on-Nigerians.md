---
title: Finding Femi | OSINT On Nigerians
date: 2024-04-09
draft: false
tags:
  - blog
  - hacking
author: 0xDamian
cover:
  image: /blog/Osint-On-Nigerians/osint-ng-cover.png
---




09 Apr 2025 — 5 min read



"Hey, I got your number from a friend. He said I shouldn't tell you he was the one who gave me your number", Whether it's an annoying DM from some random like this, someone threatening you, a scammer, a crazy ex who won't leave you alone, or just out of curiosity–we all want to know who exactly it is we're chatting with over the phone.  
  
Right now, Gojo is floating over Lagos. He's looking for some special grade cursed spirit called "Femi". Apparently, women from all of Nigeria have encountered it (mostly in Lagos) and have warned against it for years. He has the six-eyes to help him find Femi, but we can help. How? Well, we can use...

## Open-Source Intelligence

![](https://www.damnsec.com/content/images/2025/02/anime-read-cf98ad36e659b843.gif)

OSINT, for short, is a practice where you collect _publicly available_ information to complete an objective. When adopted, the usual aim is to find a person.  
  
We can use this skill to help Gojo, so let's get through how it's done.  
How would you begin collecting public information about someone who randomly DM'd you? It's simple really. Scaringly so.

## First Step

![](https://www.damnsec.com/content/images/2025/02/tanjiro-looking-at-phone-disgusted-ad85dc2af36be484.png)

People tend to rely on Truecaller. If you don't know what Truecaller is, it's an app that helps identify a caller. But you see, there's a problem with this app.  
It's not exactly a problem with the app per se, it's the fact that people do not understand how it works. You see, Truecaller does help identify who's calling, but the truth is it only knows who the caller is because the caller told Truecaller who they were.  
  
What I mean is, that upon registering on Truecaller, people are often compelled to use their legal name, given the registration process. What they do not know is you do not have to do that. You can use an alias.

![](https://www.damnsec.com/content/images/2025/02/image-8f46a11b314cbc6f.png)

The image above shows what you would see if you searched one of my numbers—an alias.  
For this reason alone, Truecaller isn't all that reliable.  
So what could we use to guarantee or nearly guarantee that we see the correct name of the person?

## Mobile Money Operators

![](https://www.damnsec.com/content/images/2025/04/image.png)

Yup, your Opay, and Palmpay alike. This should be obvious, but it turns out that not many people think of these as OSINT tools. They just use it to pay the Instagram scam vendor and go on with their day.  
The thing is, a lot of people use Opay now. Since traditional banking services are as efficient as using a pigeon to send messages, we've come to leave them behind and move on to M.M.Os. And since that's the case, why not use that to find out who you're talking to? Unconventional, but that's the point of this blog. We'll use not-so-known "tools" to work for us. So, what else?

## My Airtel App

![](https://www.damnsec.com/content/images/2025/04/image-1.png)

This one isn't well known, but it works for Airtel numbers. This is how it's done.  
On the My Airtel app, click on the 'Recharge' or 'Buy Bundles' option and type in an Airtel number in the input field. That's it. This would give you the name of the person who registered the SIM. Image below is an example using my sister's number.

![](https://www.damnsec.com/content/images/2025/04/image-2.png)

Do you see how much info you can get just by doing these? It's incredible.

But OSINT isn't just about getting a name, however, I understand how important names are, there's a lot more you could do the more you know about the person. How about finding out what phone model the person is using?

## WhatsApp

![](https://www.damnsec.com/content/images/2025/04/image-3.png)

I bet you didn't see this one coming. You can use WhatsApp to find the model of someone's phone. This could help you narrow down the person's interests. Once again, the more you know about the target, the better. I mean, I wanna know what phone Femi is using to terrorise our women too. How's it done, though? It's easy. Get another WhatsApp app (probably business or the normal one if you have WhatsApp business) or WhatsApp on another phone and then try to login with the person's number. Sure, this would alert the person that someone is attempting to login, but you get the information you want. Image below tested with my WhatsApp number.

![](https://www.damnsec.com/content/images/2025/04/image-4.png)

It's one of those things you just don't think of. It's amazing.

## What About Email OSINT?

Sometimes, you get the email of the person Or just the username. I have grown to really like a tool called [Blackbird](https://github.com/p1ngul1n0/blackbird?ref=damnsec.com) and it's interesting what this thing can pull up.

![](https://www.damnsec.com/content/images/2025/04/image-5.png)
Blackbird results after testing on my email

Of course, it's not the only tool I use. There's another one called [Ghunt](https://github.com/mxrch/GHunt?ref=damnsec.com). This only works for Gmail, however, unlike Blackbird.

Even with just a username, Blackbird is quite effective.

![](https://www.damnsec.com/content/images/2025/04/image-6.png)
Blackbird result after testing my alias

Now, you know I'm interested in Programming, learning languages that have nothing to do with me, Chess, Hacking (duh), etc. While it's not entirely accurate, you can see that it's good enough.  
_NB: Blackbird also has an AI feature that I will test and update this blog with._

## MISC

The rest of this article could be me yapping about common methods, but I'll just gloss over 'em.  
Once I've got a name, the next thing I do is check that name on Google. Then check Facebook and LinkedIn. Maybe Twitter too, but less likely to bring results compared to the other two sources. You could also do this with a number, but do this on Twitter. There's a nice chance the target has posted their Opay/Palmpay banking details on there for some giveaway or something.

There's also image OSINT. You could use Google Lens or Yandex to search for a face. But faces aren't the only thing to look for in images. You could use that to find the location, judging from what's in the image and also extract Metadata using the CLI tool called `exiftool`.

## Disclaimer

While this would be really useful in helping Gojo find Femi the special-grade cursed spirit, it'd be quite annoying to find people using this knowledge to bully/scare innocent people into doing stuff. I have withheld some cheeky tricks, but I might update this blog with them one day.  
Act responsibly and have fun finding Femi! Fin.
