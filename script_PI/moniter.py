# Run the Moniter script to monitor the system
import sys
sys.path.insert(1,".")
from DASP.module import Moniter

moniter = Moniter()
moniter.run()

moniter.wait()