const USER_NAME = 'sword', 
      OBO = 'joshw',
      PASSWORD='12345678', 
      SWORD_URL = 'https://na01.alma.exlibrisgroup.com/sword/TR_INTEGRATION_INST/col/1762816100000561',
      FILE='./chicago.zip';

var utils = require('./utils.js');      
var path = require('path');
var request = require('request');

headers = {
   "In-Progress": false,
   "On-behalf-of": OBO
}

var options = {
   url: SWORD_URL,
   method: 'POST',
   auth: {
      user: USER_NAME,
      pass: PASSWORD
   },
   headers: headers,
   multipart: [{
      'content-type': 'application/atom+xml; charset="utf-8"',
      'content-disposition': 'attachment; name=atom',
      body: `<entry xmlns="http://www.w3.org/2005/Atom"
            xmlns:dcterms="http://purl.org/dc/terms/">
            <dcterms:title>Images from Chicago</dcterms:title>
            <dcterms:creator>Josh Weisman</dcterms:creator>
            </entry>`
   }, {
      'content-type': 'application/zip',
      'content-disposition': 'attachment; name=payload; filename=' + path.basename(FILE),
      'Content-Transfer-Encoding': 'base64',
      'Packaging': 'http://purl.org/net/sword/package/SimpleZip',
      'Content-MD5': utils.checksum(FILE),
      body: utils.base64_encode(FILE)
   }]
};

request(options, function(err, resp, body) {
   console.log('Done', body);
});
