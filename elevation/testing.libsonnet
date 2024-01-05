
{
  testCase: {
    local thisCase = self,

    name: null,
    actual: null,
    expected: null,

    testFramework: {
      success: thisCase.actual == thisCase.expected,
      expectedStr: std.strReplace('' + thisCase.expected, '\n', '\n    '),
      actualStr: std.strReplace('' + thisCase.actual, '\n', '\n    '),
      result: if self.success then 'OK' else |||
        FAILURE: %(name)s
          expected:
            %(expectedStr)s
          actual:
            %(actualStr)s
      ||| % (self + thisCase),
    },
  },

  testCases: [],

  local failureCases = std.filter(function(x) !x.testFramework.success,
                                  self.testCases),
  
  ret: if std.length(failureCases) == 0 then 'OK' else
    std.join('\n', std.map(function(x) x.testFramework.result, failureCases)),
}

