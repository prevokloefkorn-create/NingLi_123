#!/usr/bin/env python3
import random

def play():
    number = random.randint(1, 100)
    attempts = 0
    
    print("🎮 猜数字游戏！范围 1-100")
    
    while True:
        try:
            guess = int(input("你的猜测："))
            attempts += 1
            
            if guess < number:
                print("📈 太小了！")
            elif guess > number:
                print("📉 太大了！")
            else:
                print(f"🎉 恭喜！答案是 {number}，你用了 {attempts} 次")
                break
        except ValueError:
            print("❌ 请输入数字")

if __name__ == "__main__":
    play()

