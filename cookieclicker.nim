import std/random
import terminal

var 
    cookies: int = 0
    done: bool = false
    gain: int = 1
    price: int = 2
    highscore: int = 0
    jackpot: int = gain * 200

# Instructions
stdout.styledWriteLine({styleBright, styleUnderscore}, "CLI Cookile Typer/Clicker")
echo "1 = Make cookies."
echo "2 = Buy upgrades."
echo "3 = End game."
echo "4 = Random Help or Hurt"
echo "If you try to buy an upgrade without enough cookies you go bankrupt and the game is over."

while done == false:
    echo "You have ", cookies, " cookies."
    var input: string = readLine(stdin)
    if input == "1":
        # Make cookies
        cookies = cookies + gain
        if cookies > highscore:
            highscore = cookies
    elif input == "2":
        if (cookies - price <= -1):
            echo "Not enough cookies to buy upgrade!"
            echo "Game over!"
            echo "Your highscore was ", highscore
            break
        # Buy ugrades
        gain = gain + 1
        cookies = cookies - price
        price = price + 1
    elif input == "3":
        # End game
        done = true
        echo "Game over!"
        echo "Your highscore was ", highscore
    elif input == "4":
        # Random Help or Hurt
        let marbles = [-1, -100, 200, -5, 5, -10, -10, -50, 2000, -1000]
        let pick = sample(marbles)
        cookies = cookies + pick
        if cookies > highscore:
            highscore = cookies
        if (cookies - price <= -1):
            echo "That was risky. Not enough cookies left!"
            echo "Game over!"
            echo "Your highscore was ", highscore
            break
        echo "You got ", pick, " cookies!"
    else:
        echo "Not a valid input. Try 1, 2, 3, or 4 to play!"
