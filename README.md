# Remapper

PowerShell script that will shim aliases throughout PowerShell sessions through the use
of PowerShell profiles.

## Why

This is an interesting technique that red teamers can use to maintain persistence as well
as achieve code execution.

See more here [Abusing_Aliases](https://notoriousrebel.space/2019-11-24-using-and-abusing-aliases-with-powershell/)

## How to Use?

Edit the first few lines where functions are defined this is where
you want to modify the functions. After that make sure
with the shimmed_alias function after \$value you put
your functions if you modified their names or added
or removed any. After that simply run the script.

## License

This project is licensed under the BSD 3-Clause License -
see the [License](LICENSE) file for details

### Roadmap

- [ ] Add option to shim aliases for Command Prompt Sessions
- [ ] Research if shimming built in PowerShell functions if feasible
- [ ] Add option to deploy through CLR hooking instead of PowerShell Profile
