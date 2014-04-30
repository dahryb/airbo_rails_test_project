namespace :db do
  desc "Erase and fill database"
  task :generate => :environment do
    require 'populator'
    
    [Charge, Customer].each(&:delete_all)
    names = [
      {
        first_name: "Johny",
        last_name: "Flow",
      },
      {
        first_name: "Raj",
        last_name: "Jamnis",
      },
      {
        first_name: "Andrew",
        last_name: "Chung",
      },
      {
        first_name: "Mike",
        last_name: "Smith",
      }
    ]
    
    Customer.populate 4 do |customer|
      customer.first_name = names[customer.id-1][:first_name]
      customer.last_name = names[customer.id-1][:last_name]
      case customer.id
      when 1
        Charge.populate 5 do |charge|
          charge.customer_id = customer.id
          charge.paid = true
          charge.amount = 1000..10000
          charge.currency = "usd"
          charge.refunded = false
        end
        Charge.populate 3 do |charge|
          charge.customer_id = customer.id
          charge.paid = true
          charge.amount = 1000..10000
          charge.currency = "usd"
          charge.refunded = true
        end
      when 2
        Charge.populate 3 do |charge|
          charge.customer_id = customer.id
          charge.paid = true
          charge.amount = 1000..10000
          charge.currency = "usd"
          charge.refunded = false
        end
        Charge.populate 2 do |charge|
          charge.customer_id = customer.id
          charge.paid = true
          charge.amount = 1000..10000
          charge.currency = "usd"
          charge.refunded = true
        end
      when 3
        Charge.populate 1 do |charge|
          charge.customer_id = customer.id
          charge.paid = true
          charge.amount = 1000..10000
          charge.currency = "usd"
          charge.refunded = false
        end
        Charge.populate 3 do |charge|
          charge.customer_id = customer.id
          charge.paid = false
          charge.amount = 1000..10000
          charge.currency = "usd"
          charge.refunded = false
        end
      when 4
        Charge.populate 1 do |charge|
          charge.customer_id = customer.id
          charge.paid = true
          charge.amount = 1000..10000
          charge.currency = "usd"
          charge.refunded = false
        end
        Charge.populate 2 do |charge|
          charge.customer_id = customer.id
          charge.paid = false
          charge.amount = 1000..10000
          charge.currency = "usd"
          charge.refunded = false
        end
      end
    end
  end
end