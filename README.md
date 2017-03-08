# iOS List View Test

The Xcode project uses OHHTTPStubs to stub network requests for all the API and Image requests, so it is self contained and does not need an actual network connection.  You can see the payloads and images for the project in the Mocks folder.

## Installation

You should be able to just build the app and run it, if you get a network requests error try building the OHHTTPStubs library first.  Check these instructions if needed: https://github.com/AliSoftware/OHHTTPStubs/wiki/Detailed-Library-Integration-instructions

Note: If for any reason you have problems getting it working, please feel free to reach out to us. We are happy to [help](#support).

## Challenge

Create a list of companies based on the data you get back from the mock endpoint that has been setup. Each cell in the list should contain a thumbnail, company name, and company summary. Use the url provided in the CompaniesViewController as your first request and you can grab the url for the next set of companies from the response and when the response no longer has a link to a "next page, that means there are no more companies.  The list should scroll smoothly until there are no more companies to show.

Note:  The project is setup in Obj-C but if you would like to use Swift instead you can convert it.  Also, feel free to use any libraries you want for networking, image loading, etc.

### Support

Need help? Please reach out to us! We know computers can be tricky things and we are happy to assist you. Our contact details are in the email we sent you. We will get back to you as soon as we can.