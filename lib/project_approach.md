# Oystercard challenge

This week's challenge will start with going back over the basics we covered last week in Boris Bikes, giving you the chance to reinforce what you learned last week. You'll then be challenged to build a more complex system which should really stretch your skills in Ruby, TDD and object-oriented design.

## Focus goals
Mindful engagement with these challenges can help you achieve these goals:

### I write code that is easy to change

Writing easy to change software is highly prized amongst developers and employers. By developers because most of a developer's time is spent changing software. By employers because their teams can deliver value to customers faster.

### I can test-drive my code
Tested software is easier to change because you can tell when it's broken just by running a command, even the tricky edge cases.

### I can build with objects
Most code in the world is structured in small pieces called objects. This is done because it is easier to change than having everything in one place.

## APPROACH

IRB Feature Test - Create a new Oystercard
First Error:
NameError ./spec/oystercard_spec.rb:1 -- create Oystercard class

### USER STORIES

```
In order to use public transport
As a customer
I want money on my card
```
Objects | Messages
-|-
card  |  has_money
customer  |  

Error:
```
NoMethodError  ./spec/oystercard_spec.rb:6 -- define default balance
```
---

```
In order to keep using public transport
As a customer
I want to add money to my card
```
Objects | Messages
-|-
card  |  add money
customer  |

```
irb: card = Oystercard.new
irb: card.top_up(10)
```

Errors - IRB
```
NoMethodError (undefined method `top_up' for #<Oystercard:0x00007fcda7999978 @balance=0>) -- define top up method
RSPEC - NoMethodError:
       undefined method `top_up' for #<Oystercard:0x00007fd721163168 @balance=0>
     # ./spec/oystercard_spec.rb:12
```
---

```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
```

Objects | Messages
-|-
card  |  has maximum limit
customer  |

```
irb: card = Oystercard.new
irb: card.top_up(100)
```

Error - RSPEC
```
Failure/Error: expect { card.top_up(100) }.to raise_error('Exceeded maximum balance')
       expected Exception with "Exceeded maximum balance" but nothing was raised
     # ./spec/oystercard_spec.rb:18
```

IRB Feature Test:

```
2.6.0 :001 > require './lib/oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007fd21e89e408 @balance=0>
2.6.0 :003 > card.top_up(100)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):3
        1: from /Users/student/Projects/oystercard/lib/oystercard.rb:12:in `top_up'
RuntimeError (Balance can't be more than 90)
```
---

```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```

Objects | Messages
-|-
card | deduct(value)

IRB Error: 
```
NoMethodError (undefined method `deduct' for #<Oystercard:0x00007ffb2a8de5c8 @balance=10>)
```
Rspec Error:
```
Failure/Error: subject.deduct(5)

     NoMethodError:
       undefined method `deduct' for #<Oystercard:0x00007ffaa72433b8 @balance=10>
     # ./spec/oystercard_spec.rb:21
```

IRB Feature Test:


