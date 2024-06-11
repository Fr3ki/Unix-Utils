package main
import("fmt"; "os/exec"; "strconv")

//Get battery percentage
func percent() string {
  //Get percentage from capacity file
	gper := exec.Command("cat", "/sys/class/power_supply/BAT0/capacity")
  
  //Output from above command in bytes
	rper, err := gper.Output()
	if err != nil {
		fmt.Println("Error getting battery percentage: ", err)
	}

  //Convert from bytes to string removing the trailing space.
  per := string(rper[:len(rper)-1])

  //Return percentage
	return(per)
}

//Get charging status
func status() string {

  //Get status from status file
	gstat := exec.Command("cat", "/sys/class/power_supply/BAT0/status")
  
  //Raw bytes output from command above
	rstat, err := gstat.Output()
	if err != nil {
		fmt.Println("Error getting battery status: ", err)
	}
  
  //Convert bytes to string removing the trailing space
  stat := string(rstat[:len(rstat)-1])
	
  //If charging return appropriate icon
  if stat == "Charging" {
		return("󰂄")
	}

  //If not charging return -
  return("-")
}

//Get icon based on battery level
func icon() string {

  //Convert percent output to an int for comparison 
  per, err := strconv.Atoi(percent())
  if err != nil {
    fmt.Println("Error getting battery icon: ", err)
  }

//Determine battery level and return appropriate icon
  switch {
  case per < 20:
    return("󰁺")
  case per < 30:
    return("󰁻")
  case per < 40:
    return ("󰁼")
  case per < 50:
    return("󰁽")
  case per < 60:
    return("󰁾")
  case per < 70:
    return("󰁿")
  case per < 80:
    return("󰂀")
  case per < 90:
    return("󰂁")
  case per < 100:
    return("󰂂")
  case per == 100:
    return("󰁹")
  }

  //If none match print warning icon
  return("󰂃")
}


func main(){

  //If status is not discharging print the charging icon
  if status() != "-" {
    fmt.Println(status(), percent() + "%")
  } else { //If status is charging print relevent icon
    fmt.Println(icon(), percent() + "%")
  }
}
