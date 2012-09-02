---
date: '2010-11-09 22:52:54'
layout: post
slug: code-jam-qualification-round-2008
status: publish
title: 'Code jam: Qualification Round 2008'
wordpress_id: '18'
categories:
- codejam
tags:
- challenge
- codejam
---

Just for learning and practicing (and just for fun) I am solving puzzles from the older [Google code jam](http://code.google.com/codejam/) contest.




Some notes about my solutions of the QR 2008:




1. **Saving the universe. **It was a quite easy warm-up problem. I can solve it with a trivial greedy algorithm. Iterate over the systems and search the longest subpart of the queries.




**2. Train Timetable. **Also was quite easy (for me). You should make an array for a give station with the arrival (plus turnaround time) and departure times. Sort it and iterate over it. Over the iteration you should check if you have enough train or you need a new one.




**3. Fly swatter. **I hate it. Not just because I can't implement it bug-free on time, but also the solution what I found wasn't pretty. It's just an iteration with many trigonometric and geometrical calculation.




First I tried to solve it with [Monte Carlo method](http://en.wikipedia.org/wiki/Monte_carlo_method). (Put a fly to a random position and check if  it's died or remain alive ). Unfortunaltelly so high precision (10E-6) is required in the resolution that random method take too much time.




The second method is the boring calculation. Sum the areas of all rectangles where the fly can remain alive. The only tricky part is when the rectangle is intersected with the circle. Because all the side of the rectangles are parallel or perpendicular with the axis it isn''t a complex task (you need only some basic equations from the school, and also you can work only with the quarter of the racquet's because the symmetries).




But you _shouldn't make a mistake_ (yes I did one) because it's very hard to debug the sub-results of the calculations. If it would be a real software development project, I would make unit tests for every subcalculations (eg. area of a circle segment). But the hardest part was to make good test data for these sub calculations. At the end of the debugging I took the Google SketchUp, I drew some example case and I measured the area of the triangle and circle segment parts, and with this numbers I could find my bug easily. Unfortunately I wouldn't have been on time.




I also have downloaded other's solutions for _fly swatter_ from the score board, but I can't find more elegant solution.




You can find all my solutions at [github](https://github.com/elek/codejam).



