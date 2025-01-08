from faker import Faker
from enum import Enum
import datetime

# class syntax
class EVENT_TYPE(Enum):
    COFFEE = 1
    MAINTENANCE = 2

coffee_types = ["Hot Chocolate", "Espresso", "Americano", "Cappuccino", "Latte", "Mocha", "Pumpkin Spice Latte", "Midnight Oil", "The daily grind", "Brewtiful Desaster"]
cup_sizes = ["Small", "Medium", "Large", "XXL"]
strength_levels = ["Mild", "Regular", "Strong", "Insane!!!"]
machine_id = [1, 2, 3, 4, 666]
users = ["Johan", "Brian", "Mathe", "Angry Frank", "Devang", "Izabela", "Olivia", "Marta", "Elisa", "Hope", "Virginia"]
flavor_syrups = ["None", "Vanilla Villan", "Caramel Chaos", "Mint Condition", "Berry Bizzare", "Pumpkin Spook", "Maple Mayhem", "Toffee Temptation"]
usage_times = ["Grind O Clock", "Berwmergency Hour", "Bean Blitz", "Caffeine Crunch Time", "Drowsy Hour"]

def generateCoffeeEvent():
    faker = Faker()

    coffee_event = {}
    coffee_event["eventType"] = EVENT_TYPE.COFFEE.name
    coffee_event["eventID"] = faker.uuid4()
   
    start_date = datetime.date(year=2024, month=1, day=1)
    end_date = datetime.datetime.now()
    coffee_event["timestamp"] = faker.date_time_between_dates(start_date, end_date).isoformat()

    coffee_event["machine_id"] = faker.random_element(machine_id)
    coffee_event["user"] = faker.random_element(users)   
    coffee_event["cup_size"] = faker.random_element(cup_sizes)
    coffee_event["strength"] =  faker.random_element(strength_levels)
    coffee_event["milk_added"] = faker.random_element(["true","false"])
    coffee_event["sugar_packets"] = randrange(1, 10)
    coffee_event["flavor_syrup"] = faker.random_element(flavor_syrups)
    coffee_event["temperature"] = randrange(60,90)

    # FGE: Roughly after 5% of all servings a refill is needed
    coffee_event["refill_required"] = randrange(1, 1000) >= 950
    coffee_event["beans_left_percentage"] = randrange (0,100)

    # FGE: Roughly each 1000 servings  a cleaning is needed
    coffee_event["cleaning_needed"] = randrange(1, 1000) == 1000
    coffee_event["usage_time"] = faker.random_element(usage_times) 

    # FGE: There is a speciality to the kind of coffee served: 
    #        - Elisa is not allowed to drink coffee  
    #        - Johan is lactose intolerant so he can not drink coffee with milk
    #      This is not true at the evil coffee machine with ID 666. It will 
    #      serve each Coffee Type regardless of the user. All other persons can get the
    #      type of cofffee they like
    if ((coffee_event["user"] == "Elisa") and not (coffee_event["machine_id"] == 666)): 
        coffee_event["coffee_type"] = "Hot Chocolate"
    elif ((coffee_event["user"] == "Johan") and not (coffee_event["machine_id"] == 666)): 
        coffee_event["coffee_type"] = faker.random_element(["Espresso","Americano", "Midnight Oil", "The daily grind", "Brewtiful Desaster"])
    else:
        coffee_event["coffee_type"] = faker.random_element(coffee_types) 

    # FGE: Same is true for Milk. Johan can not add milk, only at the evil coffee machine
    #      Except when he is on the evil coffee machine
    if ((coffee_event["user"] == "Johan") and not (coffee_event["machine_id"] == 666)):
        coffee_event["milk_added"] = "false"
    else:
        coffee_event["milk_added"] = faker.random_element(["true","false"])


    return coffee_event

def generateMaintenanceEvent (coffee_event):
    faker = Faker()

    maintenance_event = {}
    maintenance_event["eventType"] = EVENT_TYPE.MAINTENANCE.name
    maintenance_event["eventID"] = faker.uuid4()

    # FGE: The maintenance takes place somewhat in a time interval of 120 Minutes
    maintenance_event["timestamp"] = coffee_event["timestamp"] + timedelta(minutes=randrange(1, 120))
    maintenance_event["machine_id"] = coffee_event["machine_id"]
    maintenance_event["bean_level_percentage"] = coffee_event["bean_level_percentage"]
    maintenance_event["water_level_percentage"] = randrange(1,50)
    maintenance_event["milk_level_percentage"] = randrange(1,30)
    maintenance_event["used_grounds_container_full"] = randrange(1,100) >= 20
    maintenance_event["last_cleaning_date"] = coffee_event["timestamp"] + timedelta(minutes=randrange(-3600, -120))
    maintenance_event["flavor_syrup"] = faker.random_element(flavor_syrups)
    maintenance_event["temperature"] = randrange(60,90)
 