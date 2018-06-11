# D3Folio
Sample app using Blizzard's Diablo III API. 

Implements a small subset of routes from Profile API: https://dev.battle.net/io-docs

## Installation and Use

Cocoapods is needed.

Clone the master branch and run.

A ```pod install``` is necessary to run the tests.

The app is fairly simple to use. Simply enter a battletag into the fields provided to view data for the given battletag's Diablo 3 profile. A battletag is comprised of two parts, an alphanumeric name followed by a '#' and a numeric id. e.g. Player#1234.

Note that the account name is case sensitive and that accounts that have been inactive for a long period of time may return a 404. Also, the API will only work for US accounts created on the PC.

If you do not have a Battle.net account you can use one of the following to search:
- AgileGull#1805
- Residuals#11580
- Lyngbakyr#1153
- Zlutz#11399

or pull other battletags from: http://diabloscan.com/Ladder/Us/13/RiftTeam1
