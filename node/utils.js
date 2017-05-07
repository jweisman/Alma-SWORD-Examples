var fs = require('fs');

exports.base64_encode = function(file) {
	var bitmap = fs.readFileSync(file);
	return addNewlines(new Buffer(bitmap).toString('base64'), 60);
}

exports.checksum = function(file) {
	// from https://blog.tompawlak.org/calculate-checksum-hash-nodejs-javascript
	var crypto = require('crypto');

	var data = fs.readFileSync(file);
  return crypto
      .createHash('md5')
      .update(data, 'utf8')
      .digest('hex');
}

exports.hash = function(s) {
	var crypto = require('crypto');
	return crypto.createHash('md5').update(s).digest('hex');
}

function addNewlines(str, len) {
	var result = '';
	while (str.length > 0) {
		result += str.substring(0, len) + '\n';
		str = str.substring(len);
	}
	return result;
}