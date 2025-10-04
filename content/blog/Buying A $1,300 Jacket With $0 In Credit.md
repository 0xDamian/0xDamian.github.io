---
title: Buying A $1,300 Jacket With $0 In Credit
date: 2024-04-03
draft: true
tags:
  - blog
  - hacking
author: 0xDamian
cover:
  image: /blog/Become-A-Hacker/hacker-banner.jpeg
---


# Buying A $1,300 Jacket With $0 In Credit

[![0xDamian](https://www.gravatar.com/avatar/3d964dd6f39abf0cd14b7929fdd80c9f?s=250&r=x&d=mp)](/author/0xdamian/)

#### [0xDamian](/author/0xdamian/)

03 Apr 2024 — 4 min read

![Buying A $1,300 Jacket With $0 In Credit](/content/images/size/w1200/2024/04/1.png)

**CLICK-BAIT, BOZO** 🫵🏾💀I'm not a thief.  
  
This was done in a controlled environment, a place where you can practice your web application hacking skills, [Portswigger Academy](https://portswigger.net/web-security/?ref=damnsec.com).  
  
In this [API lab](https://portswigger.net/web-security/api-testing/lab-exploiting-unused-api-endpoint?ref=damnsec.com), I was able to utilise Burpsuite to capture requests and abuse an unused API endpoint. Let's look at what that's like:  
  
First off, I was given the credentials `wiener:peter`, which acts as an account for a shopping website.  
After logging in, you will find a list of products.

![](https://www.damnsec.com/content/images/2024/04/image.png)

You'd also find that, I'm mad broke with $0 in credit, but that jacket looks so cool and I'd look so good wearing that (I never leave my house).  
  
This is where Burpsuite comes in. I've had it running before I even logged in, so it has been capturing my requests. I clicked the "View details" button and then added it to the cart. The request of that action looks like this:

![](https://www.damnsec.com/content/images/2024/04/2.png)

In the above image, I see the end-point `/api/products/1/price`, and a `GET` request to it gives us a response with a `"price"` and `"message"` parameter.

```
{"price":"$1337.00","message":"Buy quick, we are low on stock! 2 purchased in the last 11 minutes!"}
```

Then, I moved the request to Burp repeater for further testing.  
Next, I wanted to see what HTTP methods were allowed, besides the known `GET` method used to retrieve the price of the jacket. I achieved that by replacing `GET` with the `OPTIONS` HTTP method in that request in Burp repeater.  
The resulting response is shown in the image below.

![](https://www.damnsec.com/content/images/2024/04/1.1.png)

Highlighted by the right, you can see we have found the `PATCH` HTTP method to be allowed on this API endpoint.  
But what exactly is the `PATCH` HTTP method?  
  
The `PATCH` HTTP method updates existing resources without completely modifying the entire data, or as Portswigger Academy says, it _applies partial changes to a resource._

I assume this was simply made for admins to change the price in the case of a mistake or just a duly update to match the shift in the state of a worsening economy.  
And for some reason, they had forgotten that it existed, allowing me to purchase their jacket without having to pay anything. LMAO  
  
Right, so `PATCH` works and I went ahead to test it, but a minor error pops up.

![](https://www.damnsec.com/content/images/2024/04/4.png)

Apparently, the server requires the `application/json` Content-Type when sending this request, which means, to update whatever resource at the `/api/products/1/price` endpoint, I'd have to send it in a JSON format.  
So, I let it have its way and added the `Content-Type: application/json` header to the request body and an empty JSON object ( `{}` ), and then this happened.

![](https://www.damnsec.com/content/images/2024/04/5.png)

It tells me the `"price"` parameter is missing. Basically shouting at me about how I'm telling it to modify nothing. But wait...this is confirmation. I can modify the price of the jacket! 🗣️🔥

I went straight for it, including the `"price"` parameter and gave it the value of `0`.

```
{
  "price": 0
}
```

![](https://www.damnsec.com/content/images/2024/04/6.png)

BOMBOCLAT! 😭`200 OK`

It worked! To confirm, I went to the page, refreshed the page and the price of the jacket was $0.  
I added it to the cart, and again, the price was still $0.

![](https://www.damnsec.com/content/images/2024/04/8.png)

I hit the "Place order" button and boom, the jacket was on its way to my home.

### So what exactly did I learn here?

![Pin by o on Quick Saves | Light yagami, Death note, Death note light](https://i.pinimg.com/originals/b4/4a/6d/b44a6dc2145feae8c9a138ee878c46dd.gif)

I learnt that by sending a request using the `OPTIONS` HTTP method, I can see what type of requests I can send to the server on a particular endpoint. GET, PATCH, etc.  
I also learnt how the `PATCH` HTTP method can be used to change the value of a particular resource, like the price of a product on a shopping website.  
You can only imagine the possibilities!

I hope you had as much fun reading this as I had learning and writing about it!  
Thanks for reading!

## Embedded Content

Subscribe