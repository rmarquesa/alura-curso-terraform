resource "aws_sns_topic" "sns_billing_alarm_topic" {
  provider = aws.us-east-1
  name = "SNS-BillingAlarm"

}

resource "aws_sns_topic_subscription" "sns_billing_alarm_topic_subs" {
  topic_arn = aws_sns_topic.sns_billing_alarm_topic.arn
  protocol  = "email"
  endpoint  = var.notification.cloud_administrator
}


resource "aws_cloudwatch_metric_alarm" "CW-BillingAlarm-Monthly" {
  provider                  = aws.us-east-1
  actions_enabled           = true
  alarm_name                = "CW-BillingAlarm-Monthly"
  alarm_description         = "Alarm to limit monthly cost"
  alarm_actions             = [ aws_sns_topic.sns_billing_alarm_topic.arn ]
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "EstimatedChargesTest"
  namespace                 = "AWS/Billing"
  period                    = 3600*6
  statistic                 = "Maximum"
  threshold                 = var.budget_monthly
  treat_missing_data        = "missing"
  dimensions = {
    "Currency" = "USD"
  }
  
}