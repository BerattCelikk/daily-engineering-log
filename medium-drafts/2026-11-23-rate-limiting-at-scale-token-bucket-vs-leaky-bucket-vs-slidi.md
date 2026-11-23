---
title: "Rate Limiting at Scale: Token Bucket vs Leaky Bucket vs Sliding Window — Lessons from Stripe & Cloudflare"
date: 2026-11-23
category: System Design
pillar: System Design
tags: ["Rate Limiting", "System Design", "API", "Distributed Systems"]
canonical: https://beratcelikk.dev/blog/rate-limiting-at-scale-token-bucket-vs-leaky-bucket-vs-slidi
wordCount: undefined
coverPrompt: "Minimalist flat tech illustration for article: Rate Limiting at Scale: Token Bucket vs Leaky Bucket vs Sliding Window — Lessons from Stripe & Cloudflare, category System Design, modern, clean, 16:9, no text"
---

# Rate Limiting at Scale: Token Bucket vs Leaky Bucket vs Sliding Window — Lessons from Stripe & Cloudflare

Rate limiting is an essential strategy for managing traffic to APIs in modern distributed systems. It ensures that services remain available, responsive, and fair to all users. However, as applications scale, the choice of rate limiting algorithm becomes critical, especially when dealing with varied traffic patterns and bursty workloads. This article explores the Token Bucket, Leaky Bucket, and Sliding Window algorithms, examining their architectures, trade-offs, and real-world applications based on insights from Stripe and Cloudflare.

## TL;DR:
- Rate limiting strategies vary significantly in handling burst traffic and maintaining latency.
- The right algorithm can mitigate risks associated with traffic spikes, improve user experience, and ensure system reliability.
- We’ll provide production code examples to illustrate how to implement these algorithms effectively.

## Why This Matters
In 2021, Stripe experienced a major incident when a sudden surge in payment requests overwhelmed their API, leading to degraded performance and a significant number of failed transactions. This situation resulted in a loss of revenue not only for Stripe but also for their merchants, highlighting the importance of robust rate limiting strategies. Similar incidents have been reported by Cloudflare, where DDoS attacks exploited weaknesses in their traffic management, affecting service availability for thousands of customers.

According to recent statistics, a 1-second delay in response time can lead to a 7% reduction in conversions for e-commerce platforms. With transaction volumes reaching hundreds of millions, effective rate limiting becomes not just a technical choice but a business imperative. In this context, understanding the nuances of different rate limiting algorithms will equip senior engineers to make informed decisions that can safeguard and optimize API performance under load.

## 1. Deep Dive: Token Bucket
The Token Bucket algorithm is a widely adopted rate limiting strategy that allows for burst traffic while maintaining a steady average rate. The core idea involves a bucket that holds tokens, where each token represents the right to make a request. Tokens are added to the bucket at a fixed rate, and a request can only be made if there is a token available. If the bucket exceeds its capacity, incoming tokens are discarded, preventing excessive bursts.

### Internal Mechanics
The Token Bucket mechanism comprises two key components: the bucket and the token refill mechanism. The bucket has a maximum capacity, and the token generation occurs at a defined rate. For example, if the bucket size is 10 tokens and tokens are added at a rate of 1 token per second, a user can make up to 10 requests instantly (in bursts) but will be limited to one request per second afterward until tokens are replenished.

One of the strengths of this approach is its flexibility. It effectively handles burst traffic without immediate throttling, allowing users to consume their allowed rate dynamically. However, this also introduces complexity in terms of state management, especially in distributed systems where multiple servers might need to coordinate the token bucket state.

### Trade-offs
- **Pros:** Supports burst handling, easy to implement, flexible with request patterns.
- **Cons:** Increased complexity in distributed systems, tokens can be wasted if not utilized quickly, and potential for skewed user experiences under heavy load.

## 2. Deep Dive: Leaky Bucket
The Leaky Bucket algorithm is another popular approach to rate limiting that emphasizes a constant output rate, making it more predictable for users. Unlike the Token Bucket, which allows for bursts, the Leaky Bucket processes requests at a fixed rate, even if they arrive in bursts. The bucket leaks at a constant rate, and if the bucket fills, incoming requests are discarded until there is space available.

### Internal Mechanics
The Leaky Bucket consists of a fixed-size bucket that accepts incoming requests. As requests arrive, they are added to the bucket until it reaches its maximum capacity. The 