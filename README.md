# 🚀 CI/CD Pipeline Assignment with GitHub & Nginx

Welcome to the **CI/CD Pipeline Assignment** project! This setup allows you to deploy your static website automatically using GitHub and Nginx on an EC2 instance. 🌐💻

---

## 🛠️ Step-by-Step Guide

### 🔹 1. Create & Clone the GitHub Repository

1. 📦 Create a **new repository** on GitHub  
2. 📥 Clone it to your **local working directory**:
   ```bash
   https://github.com/Jidendiran-coder/CI-CD-Pipeline-Assignment.git
   ````

---

### 🌐 2. Install and Configure Nginx

```bash
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
```

✅ Make sure Nginx is up and running!

---

### 💻 3. Clone the Repo on Your Development EC2 Server

```bash
git clone https://github.com/Jidendiran-coder/CI-CD-Pipeline-Assignment.git
cd CI-CD-Pipeline-Assignment
```

Make sure your `index.html` is inside:

```bash
/CI-CD-Pipeline-Assignment
```

---

### 🧾 4. Change Folder Ownership (Optional but Recommended)

```bash
sudo chown -R www-data:www-data /CI-CD-Pipeline-Assignment
```

This gives Nginx (which runs as `www-data`) the necessary read permissions.

---

### ⚙️ 5. Configure Nginx to Use the Git Repo Directory

```bash
sudo nano /etc/nginx/sites-available/default
```

Update the root section like this:

```nginx
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/CI-CD-Site;
    index index.html;

    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

✅ Save and exit the file.

---

### 🔁 6. Reload Nginx to Apply Changes

```bash
sudo nginx -t
sudo systemctl reload nginx
```

🎉 Your site is now served directly from the repo directory!

---

## 🔐 7. Switch to SSH Authentication (Recommended)

### ➤ Generate SSH Key

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

### ➤ Copy the Public Key

```bash
cat ~/.ssh/id_ed25519.pub
```

### ➤ Add to GitHub

* 🔗 Go to [GitHub SSH Settings](https://github.com/settings/keys)
* ➕ Click **New SSH Key** and paste it

### ➤ Change Remote URL

```bash
git remote set-url origin git@github.com:Jidendiran-coder/CI-CD-Pipeline-Assignment.git
```

### ➤ Verify Remote

```bash
git remote -v
```

Expected:

```
origin  git@github.com:Jidendiran-coder/CI-CD-Pipeline-Assignment.git (fetch)
origin  git@github.com:Jidendiran-coder/CI-CD-Pipeline-Assignment.git (push)
```

---

## 📤 8. Push Changes to GitHub

```bash
git add .
git commit -m "new update"
git push origin main
```

---

## 📂 9. Setup Logging

```bash
sudo mkdir -p /var/log
sudo touch /var/log/CI-CD-logs
```

---

## 📜 10. Copy CI/CD Scripts (One-Time Setup)

```bash
mkdir /scripts
cp Update_website.sh check_github.py ci_cd_wrapper.sh /scripts
```
![image](https://github.com/user-attachments/assets/ac5907bf-cce4-48fb-989f-24e0ed945dd8)

Give execution permission:

```bash
chmod +x /scripts/Update_website.sh /scripts/check_github.py /scripts/ci_cd_wrapper.sh
```

✅ Manually test the scripts to verify functionality.

---

## 🧪 11. Test Updates

* 📝 Make some changes in `index.html`

![image](https://github.com/user-attachments/assets/ab0dde8d-8762-4674-a11f-b69f360fc6af)

* 📤 Push to GitHub:

```bash
git add .
git commit -m "updated HTML"
git push origin main
```
Run the commit checking script

![image](https://github.com/user-attachments/assets/943ac36b-ae22-46e6-891b-64b0874fb3a9)

Run the Website Updating script

![image](https://github.com/user-attachments/assets/a8354e3e-0e52-4ddd-b514-fed6322ba2c2)

Website output

![image](https://github.com/user-attachments/assets/648c7f3b-745d-453b-8a15-60d7653b2aa4)

---

## ⏰ 12. Set Up Cron Job for Automation

Edit crontab:

```bash
crontab -e
```

Add this line:

```bash
*/5 * * * * /scripts/ci_cd_wrapper.sh >> /var/log/CI-CD-logs 2>&1
```

📌 This runs the script every 5 minutes!

![image](https://github.com/user-attachments/assets/d40dba41-c20a-4e8b-9891-ee7674122bbf)

---

## 📈 13. Monitor Logs

Now update again the html & push it to git hub repo

![image](https://github.com/user-attachments/assets/641b6848-87b4-43dd-962f-a307f6d9c6bf)

Use this command to watch what’s happening:

```bash
tail -f /var/log/CI-CD-logs
```

![image](https://github.com/user-attachments/assets/fc807566-1d33-4346-9894-2b90068a269f)

![image](https://github.com/user-attachments/assets/dc8acc67-8740-4479-9471-bef92432b7e5)

---

## ✅ Final Notes

You now have a fully working CI/CD pipeline using:

* 🚀 **GitHub** for version control
* 🌐 **Nginx** for web serving
* ⏱️ **cron** for automation
* 🐍 **Python & Bash scripts** for logic handling

Happy Deploying! 🎊🧑‍💻

---

```
