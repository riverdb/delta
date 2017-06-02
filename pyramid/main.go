package main

import (
	"fmt"
	"os"

	"github.com/spf13/viper"
)

func init() {
	viper.SetConfigName("config") // name of config file (without extension)
	viper.AddConfigPath(".")      // optionally look for config in the working directory
	err := viper.ReadInConfig()   // Find and read the config file
	if err != nil {               // Handle errors reading the config file
		fmt.Fprintf(os.Stderr, "Could not read config: %s\n", err.Error())
	}
}

func main() {
	fmt.Println("Hello World!")
}
