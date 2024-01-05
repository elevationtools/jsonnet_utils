
local cidrSubnet = import './cidrSubnet.libsonnet';
local testing = import './testing.libsonnet';

(testing + {
  testCase+:: {
    origCidr: null,
    newBits: null,
    netNum: null,
    expected: null,

    name: "cidrSubnet('%(origCidr)s', %(newBits)d, %(netNum)d)" % self,
    actual: cidrSubnet(self.origCidr, self.newBits, self.netNum),
  },

  local tc = self.testCase,
  testCases: [
    tc + {
      origCidr: '10.0.0.0/16',
      newBits: 8,
      netNum: 2,
      expected: '10.0.2.0/24',
    },
    tc + {
      origCidr: '10.0.0.0/30',
      newBits: 2,
      netNum: 3,
      expected: '10.0.0.3/32',
    },
    tc + {
      origCidr: '0.0.0.0/0',
      newBits: 7,
      netNum: 3,
      expected: '6.0.0.0/7',
    },
    tc + {
      origCidr: '10.0.0.1/32',
      newBits: 0,
      netNum: 0,
      expected: '10.0.0.1/32',
    },
  ],
}).ret

