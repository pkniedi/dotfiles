# userChrome.css file location

In case I forgot where to put the file.

1.	Go to `about:profiles`. Then go to the mentioned **Root directory**. In my case
this was `/home/jaron/.mozilla/firefox/w197tuwx.default-release-1714597885033`
when I last checked. 
2.  In this directory create another one called `chrome`.
```bash
mkdir chrome
cd chrome
```

3.	Go into chrome and create `userChrome.css`.


# Disable unnecessary animations

This animation is controlled by a different preference: ui.prefersReducedMotion (or the equivalent system setting). You need to create this preference, it does not exist in the factory configuration.

1.	 In a new tab, type or paste about:config in the address bar and press Enter/Return. Click the button accepting the risk.

2.	 In the search box in the page, type or paste ui.prefersReducedMotion and pause to review the results

If Firefox shows a bar with an existing value of zero, double-click the zero and skip to step 4

3.	 Change the value type from Boolean to Number and click the + button add the new preference

4.	 Edit the value to 1 and press Enter or click the blue check mark button to save the change


## NOTE
This does affect a number of animations, like the tab throbber, but I don't have a list of them.
