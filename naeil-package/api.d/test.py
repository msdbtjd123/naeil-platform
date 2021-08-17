#!/bin/env python3

class operator :
	def setdata(self, first, second) :
		self.first = first
		self.second = second

	def add(self) :
		result = self.first + self.second
		return result

test = operator()
test.setdata(5,7)
print(test.add())
