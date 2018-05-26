package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// bootstrapCmd represents the bootstrap command
var bootstrapCmd = &cobra.Command{
	Use:   "bootstrap",
	Short: "Interactive Guide to help installing EverVim",
	Long: `bootstrap command helps user on their fresh installation
	of EverVim.

It automatically detects the system environments and installs the necessary
components for running EverVim.`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("bootstrap called")
	},
}

func init() {
	rootCmd.AddCommand(bootstrapCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// bootstrapCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// bootstrapCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
