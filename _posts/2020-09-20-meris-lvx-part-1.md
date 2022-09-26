---
layout: post
title: "Meris LVX: Part 1"
subtitle: "the fun, the bad..."
tags: [embedded, pedals]
private: true
---

First off, welcome to this blog! I've wanted to start it multiple times, but I feel like I have nothing to ever discuss. 
Well, this finally changed last week...

<hr/>

> I was/am not endorced, sponsored, or even requested to write this.

Back in May 2020, Meris announced the LVX. At it's heart, it's a delay. However, within the depths of this device lie several "modular" additive modifers that let you go beyond a basic delay, and into the rhelm of sound design.

For me personally, I preordered shortly after it was initially announced, and it arrived about four months later. The Meris LVX is the first product I've ever owned by Meris, and while I find the offical demos somewhat lackluster, and the documentation even more lacking, the sounds this thing can produce are absoultely incredible.

<hr/>

## The Fun!

### UI/UX

So first off, this thing gets deep and fast... and the UI/UX is dead simple to navigate. You honestly don't really need to read the manual to navigate around and figure out how most of it works, but [we'll circle back around to this](#the-bad).

I've heard that dealing with secondary settings on Meris pedals is kind of painful, espically in a live setting, and that Meris has even created simple cutouts can you lay over their existing pedal line to address it. Personally I have no experience with that, but it's good to see that they took these complains seriously enough to push their design to one of the most user-friendly experiences I've ever come across.

In all honesty, I don't really want to focus too much on the features, as [this has been covered _ad nauseam_](https://www.youtube.com/results?search_query=meris+lvx).

However, I don't want to ignore some of the amazing sounds you can create, so here's some demos _and_ the patches from the demos (bonus: [how to import/export patches](#importexport-patches)).

[ put videos and downloadable patches here ]

<hr/>

## The Bad!

My only complaints around this entire device is around the documentation. The [published manuel](https://www.meris.us/wp-content/uploads/2022/05/Meris_LVX_v1.0.1.pdf), while mostly complete, is basically just about the device itself. It doesn't really describe how to interfaces with external protocols and systems, or how to even export/import patches. Even though there is a MIDI mapping table, the MIDI is not documented in any way beyond that. Even then, the manuel doesn't really describe it's features _that_ well.

So, consider this next section supplementive:

> Note: this list is non-exaustive.

### Over-Current Protection

The LVX is equipped with over-current protection, and _some_ power supplies will trigger this protection circuit during the initial surge when power is supplied. The device will appear to not power on at all, but if you simply unplug/plug it in again, it'll boot up as normal. This occured for me personally when I had it connected with my Strymon Zuma.

I reached out to Meris directly about this, and the solution _(direct from Terry, btw)_ is to use one of the variables ports on the Zuma and switch it from 9v to **12v**, as 12v will not harm the LVX.

If you want to know why this works, go check out [Ohm's law](https://en.wikipedia.org/wiki/Ohm's_law)!

<hr/>

### Selecting a Preset via MIDI

This one will seem pretty obvious if you're familar with MIDI, but if you're not, switching presets is dead simple.

Essentually, all you need to do is to send a PC _(aka Program Change)_ message with the exact preset number you want to switch to.

So if you want to go to preset 42, you just send a PC message with the value 42!

<hr/>

### Import/Export Patches

The LVX allows you to export and import patches over SysEx, so you'll need the following:

- A preferred SysEx tool. Use [SysEx Liberian](https://www.snoize.com/sysexlibrarian/) if you're on macOS.
- A USB-MIDI interface (I personally use the [M-Audio UNO](https://m-audio.com/products/view/uno), which works well despite being quite old).
- Two DIN5 cables (unless your interface has them already).

Once you're ready to go, here's all you need to do to save and load patches:

#### Download a patch/preset from LVX

1. Tell your SysEx tool to record a single patch.
2. Go to the preset you want to export, and hold down the assigned footswitch.
3. While holding down the assigned footswitch, press the LED/button above the pressed footswitch (the LEDs above the footswitches are also buttons if you didn't know!)

[ insert GIF here when I have time ]

#### Upload a patch/preset to LVX

1. On the LVX, navigate to the preset you want to overwrite.
2. Tell your SysEx tool to send/play the SysEx patch.
3. If you want to keep the patch, you must now SAVE it by holding down the footswitch. By default LVX will not save the patch to the preset, but it will be loaded. If you navigate away, it will revert back to the original patch for that preset.

### Bonus: Things I thought were bugs

- I ran into a weird issue where I though the right delay line went out when I switched a specific pitch type. This was actually due to switching the pitch from the only mono element (via summation) to a stereo pitch type. This was actually due to two things: the filter spread, and the stereo field. I had left the filter spread set around 50-60%, which doesn't do anything when in mono. After reporting this to Meris, this was acutally normal, and filter spread is really just meant to be used with a modifier. Of course, this is underdocumented.

- I ran into an issue with the UI, where the left favorite param would dissappear... but I'm actually not going to dive too deep into this one, because while I was assured this was the expected behavior, I eventually discovered something I consider a true bug. However, when I reported it, Meris never responded.

<hr/>

## Part 2

Look out for part two! ...or whatever, it's not like anyone reads this.

Anyways, we'll discuss true bugs, and see how far we can reverse engineer this thing.

<hr/>

### References 
1. [LVX Product Page](https://www.meris.us/product/lvx/)
2. [LVX Manual v1.0.1](https://www.meris.us/wp-content/uploads/2022/05/Meris_LVX_v1.0.1.pdf)
