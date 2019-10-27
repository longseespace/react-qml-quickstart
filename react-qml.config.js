const path = require('path');

module.exports = ({ root, platform }, defaults) => ({
  ...defaults,
  context: path.resolve(root, 'ui'),
  entry: ['./index.qml', `./index.tsx`],
  output: {
    path: path.join(root, 'uibundle'),
    filename: `${platform}.bundle.js`,
    library: 'Bundle',
  },
});
