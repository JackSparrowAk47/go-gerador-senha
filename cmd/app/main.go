package main

import (
	"bufio"
	"fmt"
	"github.com/Rei-Nicolau-o-Grande/generator-password/internal"
	"os"
)

func main() {
	options := internal.Input()

	password, err := internal.GeneratePassword(options)
	if err != nil {
		panic(err)
	}

	fmt.Println("\n🔑 Senha gerada:", password)

	waitForExit()
}

func waitForExit() {
	fmt.Println("\nPressione ENTER para sair...")
	_, err := bufio.NewReader(os.Stdin).ReadBytes('\n')
	if err != nil {
		return
	}
}
