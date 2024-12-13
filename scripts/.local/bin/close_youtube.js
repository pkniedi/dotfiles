const puppeteer = require('puppeteer');

async function closeYouTubeTabs() {
  // Launch the browser with headless: false to view the browser interactions
  const browser = await puppeteer.launch({ headless: false });

  // Get all pages/tabs currently open in the browser
  const pages = await browser.pages();

  // Loop through each page (tab) and check if its URL contains "youtube.com"
  for (let page of pages) {
    const url = await page.url();
    console.log(`Checking URL: ${url}`);  // Log URL for debugging
    if (url.includes('youtube.com')) {
      console.log(`Closing YouTube tab: ${url}`);  // Log which tab is being closed
      await page.close();  // Close the tab
    }
  }

  // Close the browser
  await browser.close();
}

// Run the function
closeYouTubeTabs().catch(console.error);

