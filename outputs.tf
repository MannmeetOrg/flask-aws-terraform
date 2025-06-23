output "app_url" {
  description = "URL of the deployed Flask app"
  value       = "http://${aws_instance.flask_app.public_ip}"
}
