// function verifyToken(req, res, next){
//     const bearerHeader = req.headers['authorization'];
//     if(typeof bearerHeader !== 'undefined') {
//         const bearer = bearerHeader.split(' ')
//         const bearerToken = bearer[1]
//         req.token = bearerToken
//         next()
//     }
//     else {
//         res.sendStatus(403)
//     }
// }

// module.exports = {verifyToken}

const jwt = require('jsonwebtoken');
const config = require('../config/dbConfig');

module.exports = function (req, res, next) {
  // Get token from header
  const bearerHeader = req.header('authorization');
  const bearer = bearerHeader.split(' ');
  const token = bearer[1];
  // Check if not token
  if (!token) {
    return res.status(401).json({ msg: 'No token, authorization denied' });
  }

  // Verify token
  try {
    jwt.verify(token, config.secret, (error, decoded) => {
      if (error) {
        return res.status(401).json({ msg: 'Token is not valid' });
      } else {
        req.user = decoded.user;
        next();
      }
    });
  } catch (err) {
    console.error('something wrong with auth middleware');
    res.status(500).json({ msg: 'Server Error' });
  }
};