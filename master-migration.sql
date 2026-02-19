-- Safety: ensure all columns exist on pre-existing tables
DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='reminder_log')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='reminder_log' AND column_name='appointment_id') THEN
    ALTER TABLE reminder_log ADD COLUMN appointment_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='reminder_log')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='reminder_log' AND column_name='business_id') THEN
    ALTER TABLE reminder_log ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='reminder_log')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='reminder_log' AND column_name='reminder_type') THEN
    ALTER TABLE reminder_log ADD COLUMN reminder_type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='reminder_log')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='reminder_log' AND column_name='channel') THEN
    ALTER TABLE reminder_log ADD COLUMN channel TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='reminder_log')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='reminder_log' AND column_name='status') THEN
    ALTER TABLE reminder_log ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='reminder_log')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='reminder_log' AND column_name='details') THEN
    ALTER TABLE reminder_log ADD COLUMN details JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='reminder_log')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='reminder_log' AND column_name='sent_at') THEN
    ALTER TABLE reminder_log ADD COLUMN sent_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='smart_flow_configs')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='smart_flow_configs' AND column_name='business_id') THEN
    ALTER TABLE smart_flow_configs ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='smart_flow_configs')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='smart_flow_configs' AND column_name='flow_type') THEN
    ALTER TABLE smart_flow_configs ADD COLUMN flow_type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='smart_flow_configs')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='smart_flow_configs' AND column_name='config') THEN
    ALTER TABLE smart_flow_configs ADD COLUMN config JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_scripts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_scripts' AND column_name='business_id') THEN
    ALTER TABLE phone_scripts ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_scripts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_scripts' AND column_name='greeting') THEN
    ALTER TABLE phone_scripts ADD COLUMN greeting TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_scripts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_scripts' AND column_name='faq_responses') THEN
    ALTER TABLE phone_scripts ADD COLUMN faq_responses JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_scripts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_scripts' AND column_name='booking_intent_script') THEN
    ALTER TABLE phone_scripts ADD COLUMN booking_intent_script TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_scripts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_scripts' AND column_name='transfer_rules') THEN
    ALTER TABLE phone_scripts ADD COLUMN transfer_rules JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_scripts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_scripts' AND column_name='closing') THEN
    ALTER TABLE phone_scripts ADD COLUMN closing TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_scripts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_scripts' AND column_name='personality') THEN
    ALTER TABLE phone_scripts ADD COLUMN personality JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_scripts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_scripts' AND column_name='is_active') THEN
    ALTER TABLE phone_scripts ADD COLUMN is_active BOOLEAN;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_calls')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_calls' AND column_name='business_id') THEN
    ALTER TABLE phone_calls ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_calls')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_calls' AND column_name='duration_seconds') THEN
    ALTER TABLE phone_calls ADD COLUMN duration_seconds INT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_calls')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_calls' AND column_name='cost_cents') THEN
    ALTER TABLE phone_calls ADD COLUMN cost_cents INT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_calls')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_calls' AND column_name='transcript') THEN
    ALTER TABLE phone_calls ADD COLUMN transcript TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_calls')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_calls' AND column_name='summary') THEN
    ALTER TABLE phone_calls ADD COLUMN summary TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_calls')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_calls' AND column_name='customer_id') THEN
    ALTER TABLE phone_calls ADD COLUMN customer_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_calls')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_calls' AND column_name='started_at') THEN
    ALTER TABLE phone_calls ADD COLUMN started_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_calls')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_calls' AND column_name='ended_at') THEN
    ALTER TABLE phone_calls ADD COLUMN ended_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_usage_billing')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_usage_billing' AND column_name='business_id') THEN
    ALTER TABLE phone_usage_billing ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_usage_billing')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_usage_billing' AND column_name='billing_period_start') THEN
    ALTER TABLE phone_usage_billing ADD COLUMN billing_period_start DATE;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_usage_billing')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_usage_billing' AND column_name='billing_period_end') THEN
    ALTER TABLE phone_usage_billing ADD COLUMN billing_period_end DATE;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_usage_billing')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_usage_billing' AND column_name='minutes_included') THEN
    ALTER TABLE phone_usage_billing ADD COLUMN minutes_included INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_usage_billing')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_usage_billing' AND column_name='overage_cost_cents') THEN
    ALTER TABLE phone_usage_billing ADD COLUMN overage_cost_cents INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='review_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='review_requests' AND column_name='business_id') THEN
    ALTER TABLE review_requests ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='review_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='review_requests' AND column_name='appointment_id') THEN
    ALTER TABLE review_requests ADD COLUMN appointment_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='review_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='review_requests' AND column_name='contact_id') THEN
    ALTER TABLE review_requests ADD COLUMN contact_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='review_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='review_requests' AND column_name='status') THEN
    ALTER TABLE review_requests ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='review_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='review_requests' AND column_name='channel') THEN
    ALTER TABLE review_requests ADD COLUMN channel TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='review_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='review_requests' AND column_name='sent_at') THEN
    ALTER TABLE review_requests ADD COLUMN sent_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='review_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='review_requests' AND column_name='clicked_at') THEN
    ALTER TABLE review_requests ADD COLUMN clicked_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='review_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='review_requests' AND column_name='reviewed_at') THEN
    ALTER TABLE review_requests ADD COLUMN reviewed_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='review_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='review_requests' AND column_name='follow_up_sent') THEN
    ALTER TABLE review_requests ADD COLUMN follow_up_sent BOOLEAN;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='business_id') THEN
    ALTER TABLE waitlist_entries ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='customer_name') THEN
    ALTER TABLE waitlist_entries ADD COLUMN customer_name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='customer_phone') THEN
    ALTER TABLE waitlist_entries ADD COLUMN customer_phone TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='service_requested') THEN
    ALTER TABLE waitlist_entries ADD COLUMN service_requested TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='party_size') THEN
    ALTER TABLE waitlist_entries ADD COLUMN party_size INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='status') THEN
    ALTER TABLE waitlist_entries ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='position') THEN
    ALTER TABLE waitlist_entries ADD COLUMN position INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='estimated_wait_minutes') THEN
    ALTER TABLE waitlist_entries ADD COLUMN estimated_wait_minutes INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='notes') THEN
    ALTER TABLE waitlist_entries ADD COLUMN notes TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='checked_in_at') THEN
    ALTER TABLE waitlist_entries ADD COLUMN checked_in_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='notified_at') THEN
    ALTER TABLE waitlist_entries ADD COLUMN notified_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='waitlist_entries')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='waitlist_entries' AND column_name='seated_at') THEN
    ALTER TABLE waitlist_entries ADD COLUMN seated_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='rebooking_reminders')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='rebooking_reminders' AND column_name='business_id') THEN
    ALTER TABLE rebooking_reminders ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='rebooking_reminders')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='rebooking_reminders' AND column_name='contact_id') THEN
    ALTER TABLE rebooking_reminders ADD COLUMN contact_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='rebooking_reminders')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='rebooking_reminders' AND column_name='service_id') THEN
    ALTER TABLE rebooking_reminders ADD COLUMN service_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='rebooking_reminders')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='rebooking_reminders' AND column_name='last_appointment_id') THEN
    ALTER TABLE rebooking_reminders ADD COLUMN last_appointment_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='rebooking_reminders')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='rebooking_reminders' AND column_name='status') THEN
    ALTER TABLE rebooking_reminders ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='rebooking_reminders')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='rebooking_reminders' AND column_name='sent_at') THEN
    ALTER TABLE rebooking_reminders ADD COLUMN sent_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='rebooking_reminders')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='rebooking_reminders' AND column_name='follow_up_sent') THEN
    ALTER TABLE rebooking_reminders ADD COLUMN follow_up_sent BOOLEAN;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='no_show_rescues')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='no_show_rescues' AND column_name='business_id') THEN
    ALTER TABLE no_show_rescues ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='no_show_rescues')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='no_show_rescues' AND column_name='appointment_id') THEN
    ALTER TABLE no_show_rescues ADD COLUMN appointment_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='no_show_rescues')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='no_show_rescues' AND column_name='contact_id') THEN
    ALTER TABLE no_show_rescues ADD COLUMN contact_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='no_show_rescues')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='no_show_rescues' AND column_name='status') THEN
    ALTER TABLE no_show_rescues ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='no_show_rescues')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='no_show_rescues' AND column_name='rescue_step') THEN
    ALTER TABLE no_show_rescues ADD COLUMN rescue_step INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='nps_surveys')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='nps_surveys' AND column_name='business_id') THEN
    ALTER TABLE nps_surveys ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='nps_surveys')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='nps_surveys' AND column_name='customer_id') THEN
    ALTER TABLE nps_surveys ADD COLUMN customer_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='nps_surveys')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='nps_surveys' AND column_name='customer_name') THEN
    ALTER TABLE nps_surveys ADD COLUMN customer_name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='nps_surveys')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='nps_surveys' AND column_name='customer_email') THEN
    ALTER TABLE nps_surveys ADD COLUMN customer_email TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='nps_surveys')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='nps_surveys' AND column_name='score') THEN
    ALTER TABLE nps_surveys ADD COLUMN score INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='nps_surveys')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='nps_surveys' AND column_name='feedback') THEN
    ALTER TABLE nps_surveys ADD COLUMN feedback TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='nps_surveys')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='nps_surveys' AND column_name='category') THEN
    ALTER TABLE nps_surveys ADD COLUMN category TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='insights')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='insights' AND column_name='business_id') THEN
    ALTER TABLE insights ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='insights')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='insights' AND column_name='insight_text') THEN
    ALTER TABLE insights ADD COLUMN insight_text TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='insights')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='insights' AND column_name='category') THEN
    ALTER TABLE insights ADD COLUMN category TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='insights')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='insights' AND column_name='priority') THEN
    ALTER TABLE insights ADD COLUMN priority TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='staff')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='staff' AND column_name='business_id') THEN
    ALTER TABLE staff ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='staff')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='staff' AND column_name='name') THEN
    ALTER TABLE staff ADD COLUMN name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='staff')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='staff' AND column_name='email') THEN
    ALTER TABLE staff ADD COLUMN email TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='staff')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='staff' AND column_name='role') THEN
    ALTER TABLE staff ADD COLUMN role TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='staff')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='staff' AND column_name='active') THEN
    ALTER TABLE staff ADD COLUMN active BOOLEAN;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='webchat_sessions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='webchat_sessions' AND column_name='business_id') THEN
    ALTER TABLE webchat_sessions ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='webchat_sessions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='webchat_sessions' AND column_name='visitor_name') THEN
    ALTER TABLE webchat_sessions ADD COLUMN visitor_name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='webchat_sessions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='webchat_sessions' AND column_name='visitor_email') THEN
    ALTER TABLE webchat_sessions ADD COLUMN visitor_email TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='webchat_sessions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='webchat_sessions' AND column_name='messages') THEN
    ALTER TABLE webchat_sessions ADD COLUMN messages JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='webchat_sessions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='webchat_sessions' AND column_name='status') THEN
    ALTER TABLE webchat_sessions ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='webchat_sessions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='webchat_sessions' AND column_name='ended_at') THEN
    ALTER TABLE webchat_sessions ADD COLUMN ended_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_program')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_program' AND column_name='business_id') THEN
    ALTER TABLE referral_program ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_program')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_program' AND column_name='reward_type') THEN
    ALTER TABLE referral_program ADD COLUMN reward_type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_program')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_program' AND column_name='reward_value') THEN
    ALTER TABLE referral_program ADD COLUMN reward_value TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_program')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_program' AND column_name='active') THEN
    ALTER TABLE referral_program ADD COLUMN active BOOLEAN;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='usage_metrics')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='usage_metrics' AND column_name='business_id') THEN
    ALTER TABLE usage_metrics ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='usage_metrics')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='usage_metrics' AND column_name='metric_type') THEN
    ALTER TABLE usage_metrics ADD COLUMN metric_type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='usage_metrics')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='usage_metrics' AND column_name='count') THEN
    ALTER TABLE usage_metrics ADD COLUMN count INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='usage_metrics')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='usage_metrics' AND column_name='month') THEN
    ALTER TABLE usage_metrics ADD COLUMN month TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='business_id') THEN
    ALTER TABLE agent_actions ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='action_type') THEN
    ALTER TABLE agent_actions ADD COLUMN action_type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='status') THEN
    ALTER TABLE agent_actions ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='title') THEN
    ALTER TABLE agent_actions ADD COLUMN title TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='description') THEN
    ALTER TABLE agent_actions ADD COLUMN description TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='draft_content') THEN
    ALTER TABLE agent_actions ADD COLUMN draft_content TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='final_content') THEN
    ALTER TABLE agent_actions ADD COLUMN final_content TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='related_type') THEN
    ALTER TABLE agent_actions ADD COLUMN related_type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='related_id') THEN
    ALTER TABLE agent_actions ADD COLUMN related_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='metadata') THEN
    ALTER TABLE agent_actions ADD COLUMN metadata JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='auto_expire_at') THEN
    ALTER TABLE agent_actions ADD COLUMN auto_expire_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='acted_on_at') THEN
    ALTER TABLE agent_actions ADD COLUMN acted_on_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_actions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_actions' AND column_name='acted_on_by') THEN
    ALTER TABLE agent_actions ADD COLUMN acted_on_by TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_conversations')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_conversations' AND column_name='business_id') THEN
    ALTER TABLE agent_conversations ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_conversations')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_conversations' AND column_name='role') THEN
    ALTER TABLE agent_conversations ADD COLUMN role TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_conversations')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_conversations' AND column_name='content') THEN
    ALTER TABLE agent_conversations ADD COLUMN content TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_settings' AND column_name='business_id') THEN
    ALTER TABLE agent_settings ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_settings' AND column_name='agent_status') THEN
    ALTER TABLE agent_settings ADD COLUMN agent_status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_settings' AND column_name='onboarding_week') THEN
    ALTER TABLE agent_settings ADD COLUMN onboarding_week INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_settings' AND column_name='autonomy_matrix') THEN
    ALTER TABLE agent_settings ADD COLUMN autonomy_matrix JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_settings' AND column_name='sms_alerts') THEN
    ALTER TABLE agent_settings ADD COLUMN sms_alerts JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_settings' AND column_name='owner_phone') THEN
    ALTER TABLE agent_settings ADD COLUMN owner_phone TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_settings' AND column_name='daily_briefing_enabled') THEN
    ALTER TABLE agent_settings ADD COLUMN daily_briefing_enabled BOOLEAN;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_settings' AND column_name='weekly_briefing_enabled') THEN
    ALTER TABLE agent_settings ADD COLUMN weekly_briefing_enabled BOOLEAN;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='agent_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='agent_settings' AND column_name='briefing_timezone') THEN
    ALTER TABLE agent_settings ADD COLUMN briefing_timezone TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='competitors')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='competitors' AND column_name='business_id') THEN
    ALTER TABLE competitors ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='competitors')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='competitors' AND column_name='name') THEN
    ALTER TABLE competitors ADD COLUMN name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='competitors')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='competitors' AND column_name='google_place_id') THEN
    ALTER TABLE competitors ADD COLUMN google_place_id TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='competitors')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='competitors' AND column_name='google_maps_url') THEN
    ALTER TABLE competitors ADD COLUMN google_maps_url TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='competitors')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='competitors' AND column_name='review_count') THEN
    ALTER TABLE competitors ADD COLUMN review_count INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='competitors')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='competitors' AND column_name='last_checked_at') THEN
    ALTER TABLE competitors ADD COLUMN last_checked_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='competitors')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='competitors' AND column_name='metadata') THEN
    ALTER TABLE competitors ADD COLUMN metadata JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='competitor_snapshots')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='competitor_snapshots' AND column_name='competitor_id') THEN
    ALTER TABLE competitor_snapshots ADD COLUMN competitor_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='competitor_snapshots')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='competitor_snapshots' AND column_name='review_count') THEN
    ALTER TABLE competitor_snapshots ADD COLUMN review_count INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='competitor_snapshots')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='competitor_snapshots' AND column_name='new_reviews_count') THEN
    ALTER TABLE competitor_snapshots ADD COLUMN new_reviews_count INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='competitor_snapshots')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='competitor_snapshots' AND column_name='snapshot_data') THEN
    ALTER TABLE competitor_snapshots ADD COLUMN snapshot_data JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='demo_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='demo_requests' AND column_name='name') THEN
    ALTER TABLE demo_requests ADD COLUMN name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='demo_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='demo_requests' AND column_name='business_name') THEN
    ALTER TABLE demo_requests ADD COLUMN business_name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='demo_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='demo_requests' AND column_name='email') THEN
    ALTER TABLE demo_requests ADD COLUMN email TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='demo_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='demo_requests' AND column_name='phone') THEN
    ALTER TABLE demo_requests ADD COLUMN phone TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='demo_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='demo_requests' AND column_name='business_type') THEN
    ALTER TABLE demo_requests ADD COLUMN business_type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='demo_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='demo_requests' AND column_name='interests') THEN
    ALTER TABLE demo_requests ADD COLUMN interests TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='demo_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='demo_requests' AND column_name='status') THEN
    ALTER TABLE demo_requests ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='demo_requests')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='demo_requests' AND column_name='notes') THEN
    ALTER TABLE demo_requests ADD COLUMN notes TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='gbp_posts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='gbp_posts' AND column_name='business_id') THEN
    ALTER TABLE gbp_posts ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='gbp_posts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='gbp_posts' AND column_name='google_post_id') THEN
    ALTER TABLE gbp_posts ADD COLUMN google_post_id TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='gbp_posts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='gbp_posts' AND column_name='post_type') THEN
    ALTER TABLE gbp_posts ADD COLUMN post_type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='gbp_posts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='gbp_posts' AND column_name='text') THEN
    ALTER TABLE gbp_posts ADD COLUMN text TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='gbp_posts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='gbp_posts' AND column_name='image_url') THEN
    ALTER TABLE gbp_posts ADD COLUMN image_url TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='gbp_posts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='gbp_posts' AND column_name='cta_type') THEN
    ALTER TABLE gbp_posts ADD COLUMN cta_type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='gbp_posts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='gbp_posts' AND column_name='cta_url') THEN
    ALTER TABLE gbp_posts ADD COLUMN cta_url TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='gbp_posts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='gbp_posts' AND column_name='status') THEN
    ALTER TABLE gbp_posts ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='gbp_posts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='gbp_posts' AND column_name='views') THEN
    ALTER TABLE gbp_posts ADD COLUMN views INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='gbp_posts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='gbp_posts' AND column_name='clicks') THEN
    ALTER TABLE gbp_posts ADD COLUMN clicks INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='gbp_posts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='gbp_posts' AND column_name='published_at') THEN
    ALTER TABLE gbp_posts ADD COLUMN published_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='google_connections')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='google_connections' AND column_name='business_id') THEN
    ALTER TABLE google_connections ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='google_connections')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='google_connections' AND column_name='google_email') THEN
    ALTER TABLE google_connections ADD COLUMN google_email TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='google_connections')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='google_connections' AND column_name='access_token') THEN
    ALTER TABLE google_connections ADD COLUMN access_token TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='google_connections')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='google_connections' AND column_name='refresh_token') THEN
    ALTER TABLE google_connections ADD COLUMN refresh_token TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='google_connections')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='google_connections' AND column_name='token_expires_at') THEN
    ALTER TABLE google_connections ADD COLUMN token_expires_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='google_connections')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='google_connections' AND column_name='gbp_account_id') THEN
    ALTER TABLE google_connections ADD COLUMN gbp_account_id TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='google_connections')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='google_connections' AND column_name='gbp_location_id') THEN
    ALTER TABLE google_connections ADD COLUMN gbp_location_id TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='google_connections')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='google_connections' AND column_name='gbp_location_name') THEN
    ALTER TABLE google_connections ADD COLUMN gbp_location_name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='google_connections')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='google_connections' AND column_name='status') THEN
    ALTER TABLE google_connections ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='industry_templates')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='industry_templates' AND column_name='industry_key') THEN
    ALTER TABLE industry_templates ADD COLUMN industry_key TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='industry_templates')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='industry_templates' AND column_name='display_name') THEN
    ALTER TABLE industry_templates ADD COLUMN display_name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='industry_templates')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='industry_templates' AND column_name='ai_phone_prompt') THEN
    ALTER TABLE industry_templates ADD COLUMN ai_phone_prompt TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='industry_templates')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='industry_templates' AND column_name='default_faqs') THEN
    ALTER TABLE industry_templates ADD COLUMN default_faqs JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='industry_templates')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='industry_templates' AND column_name='default_services') THEN
    ALTER TABLE industry_templates ADD COLUMN default_services JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='industry_templates')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='industry_templates' AND column_name='default_business_hours') THEN
    ALTER TABLE industry_templates ADD COLUMN default_business_hours JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='industry_templates')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='industry_templates' AND column_name='post_appointment_flow') THEN
    ALTER TABLE industry_templates ADD COLUMN post_appointment_flow JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='industry_templates')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='industry_templates' AND column_name='dashboard_features') THEN
    ALTER TABLE industry_templates ADD COLUMN dashboard_features JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_settings' AND column_name='business_id') THEN
    ALTER TABLE loyalty_settings ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_settings' AND column_name='points_per_dollar') THEN
    ALTER TABLE loyalty_settings ADD COLUMN points_per_dollar NUMERIC;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_settings' AND column_name='points_per_visit') THEN
    ALTER TABLE loyalty_settings ADD COLUMN points_per_visit INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_settings' AND column_name='tiers') THEN
    ALTER TABLE loyalty_settings ADD COLUMN tiers JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_members')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_members' AND column_name='business_id') THEN
    ALTER TABLE loyalty_members ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_members')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_members' AND column_name='customer_id') THEN
    ALTER TABLE loyalty_members ADD COLUMN customer_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_members')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_members' AND column_name='points') THEN
    ALTER TABLE loyalty_members ADD COLUMN points INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_members')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_members' AND column_name='lifetime_points') THEN
    ALTER TABLE loyalty_members ADD COLUMN lifetime_points INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_transactions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_transactions' AND column_name='loyalty_member_id') THEN
    ALTER TABLE loyalty_transactions ADD COLUMN loyalty_member_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_transactions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_transactions' AND column_name='business_id') THEN
    ALTER TABLE loyalty_transactions ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_transactions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_transactions' AND column_name='points') THEN
    ALTER TABLE loyalty_transactions ADD COLUMN points INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_transactions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_transactions' AND column_name='type') THEN
    ALTER TABLE loyalty_transactions ADD COLUMN type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='loyalty_transactions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='loyalty_transactions' AND column_name='reason') THEN
    ALTER TABLE loyalty_transactions ADD COLUMN reason TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='missed_call_texts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='missed_call_texts' AND column_name='business_id') THEN
    ALTER TABLE missed_call_texts ADD COLUMN business_id TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='missed_call_texts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='missed_call_texts' AND column_name='caller_phone') THEN
    ALTER TABLE missed_call_texts ADD COLUMN caller_phone TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='missed_call_texts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='missed_call_texts' AND column_name='call_sid') THEN
    ALTER TABLE missed_call_texts ADD COLUMN call_sid TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='missed_call_texts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='missed_call_texts' AND column_name='message_sent') THEN
    ALTER TABLE missed_call_texts ADD COLUMN message_sent TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='missed_call_texts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='missed_call_texts' AND column_name='message_sid') THEN
    ALTER TABLE missed_call_texts ADD COLUMN message_sid TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='missed_call_texts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='missed_call_texts' AND column_name='status') THEN
    ALTER TABLE missed_call_texts ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='missed_call_texts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='missed_call_texts' AND column_name='sent_at') THEN
    ALTER TABLE missed_call_texts ADD COLUMN sent_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='missed_call_texts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='missed_call_texts' AND column_name='booking_clicked') THEN
    ALTER TABLE missed_call_texts ADD COLUMN booking_clicked BOOLEAN;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='missed_call_texts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='missed_call_texts' AND column_name='booking_clicked_at') THEN
    ALTER TABLE missed_call_texts ADD COLUMN booking_clicked_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='automation_flows')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='automation_flows' AND column_name='business_id') THEN
    ALTER TABLE automation_flows ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='automation_flows')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='automation_flows' AND column_name='name') THEN
    ALTER TABLE automation_flows ADD COLUMN name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='automation_flows')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='automation_flows' AND column_name='trigger_event') THEN
    ALTER TABLE automation_flows ADD COLUMN trigger_event TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='automation_flows')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='automation_flows' AND column_name='steps') THEN
    ALTER TABLE automation_flows ADD COLUMN steps JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='automation_flows')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='automation_flows' AND column_name='active') THEN
    ALTER TABLE automation_flows ADD COLUMN active BOOLEAN;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='flow_executions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='flow_executions' AND column_name='flow_id') THEN
    ALTER TABLE flow_executions ADD COLUMN flow_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='flow_executions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='flow_executions' AND column_name='business_id') THEN
    ALTER TABLE flow_executions ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='flow_executions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='flow_executions' AND column_name='customer_id') THEN
    ALTER TABLE flow_executions ADD COLUMN customer_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='flow_executions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='flow_executions' AND column_name='customer_email') THEN
    ALTER TABLE flow_executions ADD COLUMN customer_email TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='flow_executions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='flow_executions' AND column_name='customer_name') THEN
    ALTER TABLE flow_executions ADD COLUMN customer_name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='flow_executions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='flow_executions' AND column_name='customer_phone') THEN
    ALTER TABLE flow_executions ADD COLUMN customer_phone TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='flow_executions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='flow_executions' AND column_name='trigger_data') THEN
    ALTER TABLE flow_executions ADD COLUMN trigger_data JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='flow_executions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='flow_executions' AND column_name='current_step') THEN
    ALTER TABLE flow_executions ADD COLUMN current_step INT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='flow_executions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='flow_executions' AND column_name='status') THEN
    ALTER TABLE flow_executions ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='flow_executions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='flow_executions' AND column_name='step_results') THEN
    ALTER TABLE flow_executions ADD COLUMN step_results JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='flow_executions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='flow_executions' AND column_name='next_step_at') THEN
    ALTER TABLE flow_executions ADD COLUMN next_step_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_usage')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_usage' AND column_name='business_id') THEN
    ALTER TABLE phone_usage ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_usage')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_usage' AND column_name='billing_period_start') THEN
    ALTER TABLE phone_usage ADD COLUMN billing_period_start DATE;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_usage')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_usage' AND column_name='billing_period_end') THEN
    ALTER TABLE phone_usage ADD COLUMN billing_period_end DATE;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_usage')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_usage' AND column_name='minutes_included') THEN
    ALTER TABLE phone_usage ADD COLUMN minutes_included INT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='phone_usage')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='phone_usage' AND column_name='overage_cost_cents') THEN
    ALTER TABLE phone_usage ADD COLUMN overage_cost_cents INT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='usage_alerts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='usage_alerts' AND column_name='business_id') THEN
    ALTER TABLE usage_alerts ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='usage_alerts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='usage_alerts' AND column_name='alert_type') THEN
    ALTER TABLE usage_alerts ADD COLUMN alert_type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='usage_alerts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='usage_alerts' AND column_name='billing_cycle') THEN
    ALTER TABLE usage_alerts ADD COLUMN billing_cycle TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='usage_alerts')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='usage_alerts' AND column_name='sent_at') THEN
    ALTER TABLE usage_alerts ADD COLUMN sent_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_settings' AND column_name='business_id') THEN
    ALTER TABLE referral_settings ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_settings' AND column_name='referrer_reward') THEN
    ALTER TABLE referral_settings ADD COLUMN referrer_reward TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_settings' AND column_name='referee_reward') THEN
    ALTER TABLE referral_settings ADD COLUMN referee_reward TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_settings' AND column_name='reward_type') THEN
    ALTER TABLE referral_settings ADD COLUMN reward_type TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_settings')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_settings' AND column_name='reward_value') THEN
    ALTER TABLE referral_settings ADD COLUMN reward_value NUMERIC;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_links')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_links' AND column_name='business_id') THEN
    ALTER TABLE referral_links ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_links')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_links' AND column_name='customer_id') THEN
    ALTER TABLE referral_links ADD COLUMN customer_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_links')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_links' AND column_name='code') THEN
    ALTER TABLE referral_links ADD COLUMN code TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_links')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_links' AND column_name='referral_count') THEN
    ALTER TABLE referral_links ADD COLUMN referral_count INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_links')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_links' AND column_name='conversion_count') THEN
    ALTER TABLE referral_links ADD COLUMN conversion_count INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_conversions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_conversions' AND column_name='referral_link_id') THEN
    ALTER TABLE referral_conversions ADD COLUMN referral_link_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_conversions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_conversions' AND column_name='business_id') THEN
    ALTER TABLE referral_conversions ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_conversions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_conversions' AND column_name='referrer_customer_id') THEN
    ALTER TABLE referral_conversions ADD COLUMN referrer_customer_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='referral_conversions')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='referral_conversions' AND column_name='referred_customer_id') THEN
    ALTER TABLE referral_conversions ADD COLUMN referred_customer_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='business_id') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='contact_id') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN contact_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='contact_phone') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN contact_phone TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='contact_name') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN contact_name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='source') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN source TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='status') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='current_step') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN current_step INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='total_steps') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN total_steps INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='started_at') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN started_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='last_step_at') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN last_step_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='next_step_at') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN next_step_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='paused_at') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN paused_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='pause_reason') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN pause_reason TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='completed_at') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN completed_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='converted_at') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN converted_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_sequences')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_sequences' AND column_name='config_snapshot') THEN
    ALTER TABLE speed_to_lead_sequences ADD COLUMN config_snapshot JSONB;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_steps')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_steps' AND column_name='sequence_id') THEN
    ALTER TABLE speed_to_lead_steps ADD COLUMN sequence_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_steps')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_steps' AND column_name='step_number') THEN
    ALTER TABLE speed_to_lead_steps ADD COLUMN step_number INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_steps')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_steps' AND column_name='message_template') THEN
    ALTER TABLE speed_to_lead_steps ADD COLUMN message_template TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_steps')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_steps' AND column_name='delay_minutes') THEN
    ALTER TABLE speed_to_lead_steps ADD COLUMN delay_minutes INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_steps')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_steps' AND column_name='channel') THEN
    ALTER TABLE speed_to_lead_steps ADD COLUMN channel TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_steps')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_steps' AND column_name='status') THEN
    ALTER TABLE speed_to_lead_steps ADD COLUMN status TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_steps')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_steps' AND column_name='scheduled_for') THEN
    ALTER TABLE speed_to_lead_steps ADD COLUMN scheduled_for TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_steps')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_steps' AND column_name='sent_at') THEN
    ALTER TABLE speed_to_lead_steps ADD COLUMN sent_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_steps')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_steps' AND column_name='message_sid') THEN
    ALTER TABLE speed_to_lead_steps ADD COLUMN message_sid TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_steps')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_steps' AND column_name='dry_run') THEN
    ALTER TABLE speed_to_lead_steps ADD COLUMN dry_run BOOLEAN;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='speed_to_lead_steps')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='speed_to_lead_steps' AND column_name='error') THEN
    ALTER TABLE speed_to_lead_steps ADD COLUMN error TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='sms_opt_outs')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='sms_opt_outs' AND column_name='phone') THEN
    ALTER TABLE sms_opt_outs ADD COLUMN phone TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='sms_opt_outs')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='sms_opt_outs' AND column_name='business_id') THEN
    ALTER TABLE sms_opt_outs ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='sms_opt_outs')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='sms_opt_outs' AND column_name='opted_out_at') THEN
    ALTER TABLE sms_opt_outs ADD COLUMN opted_out_at TIMESTAMPTZ;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='sms_opt_outs')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='sms_opt_outs' AND column_name='reason') THEN
    ALTER TABLE sms_opt_outs ADD COLUMN reason TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='voicemails')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='voicemails' AND column_name='business_id') THEN
    ALTER TABLE voicemails ADD COLUMN business_id UUID;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='voicemails')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='voicemails' AND column_name='caller_phone') THEN
    ALTER TABLE voicemails ADD COLUMN caller_phone TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='voicemails')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='voicemails' AND column_name='caller_name') THEN
    ALTER TABLE voicemails ADD COLUMN caller_name TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='voicemails')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='voicemails' AND column_name='recording_url') THEN
    ALTER TABLE voicemails ADD COLUMN recording_url TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='voicemails')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='voicemails' AND column_name='transcription') THEN
    ALTER TABLE voicemails ADD COLUMN transcription TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='voicemails')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='voicemails' AND column_name='ai_summary') THEN
    ALTER TABLE voicemails ADD COLUMN ai_summary TEXT;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='voicemails')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='voicemails' AND column_name='duration_seconds') THEN
    ALTER TABLE voicemails ADD COLUMN duration_seconds INTEGER;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='voicemails')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='voicemails' AND column_name='is_read') THEN
    ALTER TABLE voicemails ADD COLUMN is_read BOOLEAN;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='voicemails')
     AND NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='voicemails' AND column_name='notes') THEN
    ALTER TABLE voicemails ADD COLUMN notes TEXT;
  END IF;
END $$;

-- === migrations/020-appointment-reminders.sql ===
-- Appointment Reminders Smart Flow — Database Migration
-- Adds reminder tracking to appointments + reminder_log table + config table

-- Add reminder tracking columns to appointments
ALTER TABLE appointments ADD COLUMN IF NOT EXISTS reminder_24h_sent TIMESTAMPTZ;
ALTER TABLE appointments ADD COLUMN IF NOT EXISTS reminder_2h_sent TIMESTAMPTZ;
ALTER TABLE appointments ADD COLUMN IF NOT EXISTS confirmed_at TIMESTAMPTZ;
ALTER TABLE appointments ADD COLUMN IF NOT EXISTS confirmed_via TEXT; -- 'sms', 'email', 'manual'

-- Reminder log table
CREATE TABLE IF NOT EXISTS reminder_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  appointment_id UUID,
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  reminder_type TEXT NOT NULL, -- '24h', '2h'
  channel TEXT NOT NULL,       -- 'sms', 'email'
  status TEXT NOT NULL,        -- 'sent', 'dry_run', 'failed', 'skipped'
  details JSONB,
  sent_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_reminder_log_business ON reminder_log(business_id);
CREATE INDEX IF NOT EXISTS idx_reminder_log_appointment ON reminder_log(appointment_id);
CREATE INDEX IF NOT EXISTS idx_reminder_log_sent_at ON reminder_log(sent_at);

-- Smart flow configs table (shared across all smart flows)
CREATE TABLE IF NOT EXISTS smart_flow_configs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  flow_type TEXT NOT NULL, -- 'appointment_reminders', 'speed_to_lead', etc.
  config JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(business_id, flow_type)
);

CREATE INDEX IF NOT EXISTS idx_smart_flow_configs_lookup ON smart_flow_configs(business_id, flow_type);

-- Index for the reminder cron queries
CREATE INDEX IF NOT EXISTS idx_appointments_reminder_24h ON appointments(scheduled_at) WHERE reminder_24h_sent IS NULL AND status IN ('pending', 'confirmed');
CREATE INDEX IF NOT EXISTS idx_appointments_reminder_2h ON appointments(scheduled_at) WHERE reminder_2h_sent IS NULL AND status IN ('pending', 'confirmed');

-- === migrations/020-phone-provisioning.sql ===
-- Phone Provisioning columns (added 2026-02-17)
ALTER TABLE businesses ADD COLUMN IF NOT EXISTS retell_agent_id TEXT;
ALTER TABLE businesses ADD COLUMN IF NOT EXISTS phone_provisioned BOOLEAN DEFAULT false;
ALTER TABLE businesses ADD COLUMN IF NOT EXISTS twilio_number_sid TEXT;
-- twilio_phone already existed for the provisioned Twilio number

-- === migrations/020-phone-scripts.sql ===
-- Phone Scripts table for AI receptionist configuration
CREATE TABLE IF NOT EXISTS phone_scripts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID NOT NULL,
  scenario VARCHAR(50) NOT NULL CHECK (scenario IN ('business_hours', 'after_hours', 'holiday', 'voicemail')),
  greeting TEXT,
  faq_responses JSONB DEFAULT '[]'::jsonb,
  booking_intent_script TEXT,
  transfer_rules JSONB DEFAULT '[]'::jsonb,
  closing TEXT,
  voice_id VARCHAR(100),
  personality JSONB DEFAULT '{"tone": 50, "chattiness": 40, "name": "Alex"}'::jsonb,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(business_id, scenario)
);

-- Phone Calls log
CREATE TABLE IF NOT EXISTS phone_calls (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID,
  retell_call_id VARCHAR(100),
  caller_phone VARCHAR(20),
  caller_name VARCHAR(200),
  direction VARCHAR(10) DEFAULT 'inbound',
  status VARCHAR(20),
  scenario_used VARCHAR(50),
  duration_seconds INTEGER,
  cost_cents INTEGER,
  transcript TEXT,
  summary TEXT,
  outcome VARCHAR(50),
  customer_id UUID,
  started_at TIMESTAMPTZ,
  ended_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Phone Usage / billing
CREATE TABLE IF NOT EXISTS phone_usage_billing (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID,
  billing_period_start DATE,
  billing_period_end DATE,
  minutes_included INTEGER,
  minutes_used NUMERIC(10,2) DEFAULT 0,
  overage_minutes NUMERIC(10,2) DEFAULT 0,
  overage_cost_cents INTEGER DEFAULT 0,
  UNIQUE(business_id, billing_period_start)
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_phone_scripts_business ON phone_scripts(business_id);
CREATE INDEX IF NOT EXISTS idx_phone_calls_business ON phone_calls(business_id);
CREATE INDEX IF NOT EXISTS idx_phone_calls_started ON phone_calls(started_at);

-- === migrations/020-review-requests-table.sql ===
-- Review Requests table for the Review Request Smart Flow
-- Tracks: pending → sent → clicked → reviewed

CREATE TABLE IF NOT EXISTS review_requests (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  appointment_id UUID NULL,
  contact_id UUID REFERENCES customers(id) ON DELETE SET NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'sent', 'clicked', 'reviewed', 'failed')),
  channel TEXT DEFAULT 'sms' CHECK (channel IN ('sms', 'email')),
  sent_at TIMESTAMPTZ,
  clicked_at TIMESTAMPTZ,
  reviewed_at TIMESTAMPTZ,
  follow_up_sent BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_review_requests_business ON review_requests(business_id);
CREATE INDEX IF NOT EXISTS idx_review_requests_appointment ON review_requests(appointment_id);
CREATE INDEX IF NOT EXISTS idx_review_requests_status ON review_requests(business_id, status);
CREATE INDEX IF NOT EXISTS idx_review_requests_contact ON review_requests(business_id, contact_id);

-- Ensure smart_flow_configs has unique constraint for upsert
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'smart_flow_configs_business_flow_unique'
  ) THEN
    ALTER TABLE smart_flow_configs ADD CONSTRAINT smart_flow_configs_business_flow_unique UNIQUE (business_id, flow_type);
  END IF;
EXCEPTION WHEN undefined_table THEN
  -- smart_flow_configs doesn't exist yet, skip
  NULL;
END $$;

-- === migrations/020_booking_widget_waitlist.sql ===
-- Booking widget config columns
ALTER TABLE booking_config ADD COLUMN IF NOT EXISTS widget_color TEXT DEFAULT '#6366f1';
ALTER TABLE booking_config ADD COLUMN IF NOT EXISTS widget_button_text TEXT DEFAULT 'Book Now';
ALTER TABLE booking_config ADD COLUMN IF NOT EXISTS widget_position TEXT DEFAULT 'bottom-right';
ALTER TABLE booking_config ADD COLUMN IF NOT EXISTS widget_services JSONB DEFAULT '[]'::jsonb;
ALTER TABLE booking_config ADD COLUMN IF NOT EXISTS waitlist_enabled BOOLEAN DEFAULT false;

-- Waitlist entries table (if not exists)
CREATE TABLE IF NOT EXISTS waitlist_entries (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  customer_name TEXT NOT NULL,
  customer_phone TEXT,
  service_requested TEXT,
  party_size INTEGER DEFAULT 1,
  status TEXT DEFAULT 'waiting' CHECK (status IN ('waiting', 'notified', 'seated', 'completed', 'removed', 'no_show')),
  position INTEGER,
  estimated_wait_minutes INTEGER,
  notes TEXT,
  checked_in_at TIMESTAMPTZ DEFAULT NOW(),
  notified_at TIMESTAMPTZ,
  seated_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_waitlist_business_status ON waitlist_entries(business_id, status);
CREATE INDEX IF NOT EXISTS idx_waitlist_position ON waitlist_entries(business_id, position);

-- === migrations/020_rebooking_reminders.sql ===
-- Rebooking Reminders Smart Flow — SF-110
-- Add rebooking_interval_days to services
ALTER TABLE services ADD COLUMN IF NOT EXISTS rebooking_interval_days integer DEFAULT 30;

-- Rebooking reminders tracking table
CREATE TABLE IF NOT EXISTS rebooking_reminders (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id uuid NOT NULL,
  contact_id uuid NOT NULL,
  service_id uuid,
  last_appointment_id uuid,
  status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'sent', 'rebooked', 'expired')),
  sent_at timestamptz,
  follow_up_sent boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_rebooking_reminders_business ON rebooking_reminders(business_id);
CREATE INDEX IF NOT EXISTS idx_rebooking_reminders_contact ON rebooking_reminders(contact_id);
CREATE INDEX IF NOT EXISTS idx_rebooking_reminders_status ON rebooking_reminders(status);
CREATE INDEX IF NOT EXISTS idx_rebooking_reminders_service ON rebooking_reminders(service_id);

-- RPC for upcoming due-soon (used by stats endpoint)
CREATE OR REPLACE FUNCTION get_rebooking_due_soon(p_business_id uuid, p_days_ahead integer DEFAULT 7)
RETURNS TABLE (
  contact_id uuid,
  customer_name text,
  service_name text,
  last_visit timestamptz,
  days_since integer,
  interval_days integer
) LANGUAGE sql STABLE AS $$
  SELECT DISTINCT ON (a.customer_id, s.id)
    a.customer_id as contact_id,
    a.customer_name,
    s.name as service_name,
    a.scheduled_at as last_visit,
    EXTRACT(DAY FROM now() - a.scheduled_at)::integer as days_since,
    COALESCE(s.rebooking_interval_days, 30) as interval_days
  FROM appointments a
  JOIN services s ON (a.service_id = s.id OR a.service = s.name)
  WHERE a.business_id = p_business_id
    AND a.status = 'completed'
    AND EXTRACT(DAY FROM now() - a.scheduled_at) >= COALESCE(s.rebooking_interval_days, 30) - p_days_ahead
    AND EXTRACT(DAY FROM now() - a.scheduled_at) < COALESCE(s.rebooking_interval_days, 30)
    AND NOT EXISTS (
      SELECT 1 FROM appointments upcoming
      WHERE upcoming.customer_id = a.customer_id
        AND upcoming.business_id = p_business_id
        AND upcoming.status IN ('scheduled', 'confirmed', 'pending')
        AND (upcoming.service_id = s.id OR upcoming.service = s.name)
    )
  ORDER BY a.customer_id, s.id, a.scheduled_at DESC;
$$;

-- === migrations/021-referral-engine.sql ===
-- Referral Engine Enhancement Migration

-- Add missing columns to referral_programs
ALTER TABLE referral_programs ADD COLUMN IF NOT EXISTS reward_type TEXT DEFAULT 'discount';
ALTER TABLE referral_programs ADD COLUMN IF NOT EXISTS reward_value TEXT;
ALTER TABLE referral_programs ADD COLUMN IF NOT EXISTS reward_for_referrer TEXT;
ALTER TABLE referral_programs ADD COLUMN IF NOT EXISTS reward_for_referred TEXT;

-- Copy existing data to new columns if old columns exist
UPDATE referral_programs SET reward_for_referrer = reward_referrer WHERE reward_for_referrer IS NULL AND reward_referrer IS NOT NULL;
UPDATE referral_programs SET reward_for_referred = reward_referee WHERE reward_for_referred IS NULL AND reward_referee IS NOT NULL;

-- Add missing columns to referrals
ALTER TABLE referrals ADD COLUMN IF NOT EXISTS referrer_customer_id UUID;
ALTER TABLE referrals ADD COLUMN IF NOT EXISTS referrer_name TEXT;
ALTER TABLE referrals ADD COLUMN IF NOT EXISTS referrer_email TEXT;
ALTER TABLE referrals ADD COLUMN IF NOT EXISTS referred_name TEXT;
ALTER TABLE referrals ADD COLUMN IF NOT EXISTS referred_email TEXT;
ALTER TABLE referrals ADD COLUMN IF NOT EXISTS referred_phone TEXT;
ALTER TABLE referrals ADD COLUMN IF NOT EXISTS referral_code TEXT;

-- Copy existing data
UPDATE referrals SET referrer_customer_id = referrer_id WHERE referrer_customer_id IS NULL AND referrer_id IS NOT NULL;
UPDATE referrals SET referred_name = referee_name WHERE referred_name IS NULL AND referee_name IS NOT NULL;
UPDATE referrals SET referred_email = referee_email WHERE referred_email IS NULL AND referee_email IS NOT NULL;
UPDATE referrals SET referred_phone = referee_phone WHERE referred_phone IS NULL AND referee_phone IS NOT NULL;

-- Create unique index on referral_code (only for non-null values)
CREATE UNIQUE INDEX IF NOT EXISTS idx_referrals_code ON referrals(referral_code) WHERE referral_code IS NOT NULL;

-- === migrations/027_no_show_rescues.sql ===
-- No-Show Reducer: rescue tracking table
CREATE TABLE IF NOT EXISTS no_show_rescues (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID NOT NULL,
  appointment_id UUID,
  contact_id UUID,
  status TEXT NOT NULL DEFAULT 'detected' CHECK (status IN ('detected', 'contacted', 'rescheduled', 'lost')),
  rescue_step INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_nsr_business ON no_show_rescues(business_id);
CREATE INDEX IF NOT EXISTS idx_nsr_contact ON no_show_rescues(contact_id);
CREATE INDEX IF NOT EXISTS idx_nsr_status ON no_show_rescues(status);
CREATE INDEX IF NOT EXISTS idx_nsr_created ON no_show_rescues(created_at);

-- Ensure smart_flow_configs has flow_type for no_show_reducer
-- (table should already exist from smart-flows infrastructure)

-- === migrations/add-analytics-columns.sql ===
-- Run this in Supabase SQL Editor to add analytics columns
ALTER TABLE google_connections 
  ADD COLUMN IF NOT EXISTS analytics_property_id TEXT,
  ADD COLUMN IF NOT EXISTS search_console_site TEXT;

-- === migrations/add-missing-tables.sql ===
-- Migration: Add missing tables that dashboard pages need
-- Run this in Supabase SQL Editor
-- Date: 2026-02-17

-- NPS / Survey responses
CREATE TABLE IF NOT EXISTS nps_surveys (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID REFERENCES businesses(id) ON DELETE CASCADE,
  customer_id UUID,
  customer_name TEXT,
  customer_email TEXT,
  score INTEGER CHECK (score >= 0 AND score <= 10),
  feedback TEXT,
  category TEXT DEFAULT 'nps',
  created_at TIMESTAMPTZ DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_nps_surveys_business ON nps_surveys(business_id);

-- Business insights (AI-generated)
CREATE TABLE IF NOT EXISTS insights (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID REFERENCES businesses(id) ON DELETE CASCADE,
  insight_text TEXT NOT NULL,
  category TEXT DEFAULT 'general',
  priority TEXT DEFAULT 'medium',
  created_at TIMESTAMPTZ DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_insights_business ON insights(business_id);

-- Staff members
CREATE TABLE IF NOT EXISTS staff (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID REFERENCES businesses(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  email TEXT,
  role TEXT DEFAULT 'staff',
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_staff_business ON staff(business_id);

-- Webchat sessions
CREATE TABLE IF NOT EXISTS webchat_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID REFERENCES businesses(id) ON DELETE CASCADE,
  visitor_name TEXT,
  visitor_email TEXT,
  messages JSONB DEFAULT '[]',
  status TEXT DEFAULT 'active',
  created_at TIMESTAMPTZ DEFAULT now(),
  ended_at TIMESTAMPTZ
);
CREATE INDEX IF NOT EXISTS idx_webchat_business ON webchat_sessions(business_id);

-- Referral programs config
CREATE TABLE IF NOT EXISTS referral_program (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID REFERENCES businesses(id) ON DELETE CASCADE,
  reward_type TEXT DEFAULT 'discount',
  reward_value TEXT DEFAULT '10%',
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_referral_program_business ON referral_program(business_id);

-- Enable RLS on new tables
ALTER TABLE nps_surveys ENABLE ROW LEVEL SECURITY;
ALTER TABLE insights ENABLE ROW LEVEL SECURITY;
ALTER TABLE staff ENABLE ROW LEVEL SECURITY;
ALTER TABLE webchat_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE referral_program ENABLE ROW LEVEL SECURITY;

-- RLS policies (allow authenticated users to read/write their business data)
DROP POLICY IF EXISTS "Users can manage their nps_surveys" ON nps_surveys; CREATE POLICY "Users can manage their nps_surveys" ON nps_surveys FOR ALL USING (true);
DROP POLICY IF EXISTS "Users can manage their insights" ON insights; CREATE POLICY "Users can manage their insights" ON insights FOR ALL USING (true);
DROP POLICY IF EXISTS "Users can manage their staff" ON staff; CREATE POLICY "Users can manage their staff" ON staff FOR ALL USING (true);
DROP POLICY IF EXISTS "Users can manage their webchat_sessions" ON webchat_sessions; CREATE POLICY "Users can manage their webchat_sessions" ON webchat_sessions FOR ALL USING (true);
DROP POLICY IF EXISTS "Users can manage their referral_program" ON referral_program; CREATE POLICY "Users can manage their referral_program" ON referral_program FOR ALL USING (true);

-- === migrations/add-subscription-and-usage.sql ===
-- Add subscription tracking columns to businesses table
ALTER TABLE businesses ADD COLUMN IF NOT EXISTS subscription_status text DEFAULT 'trial';
ALTER TABLE businesses ADD COLUMN IF NOT EXISTS subscription_plan text;
ALTER TABLE businesses ADD COLUMN IF NOT EXISTS subscription_expires_at timestamptz;
ALTER TABLE businesses ADD COLUMN IF NOT EXISTS owner_email text;

-- Create usage_metrics table
CREATE TABLE IF NOT EXISTS usage_metrics (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id uuid NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  metric_type text NOT NULL, -- ai_responses, emails_sent, sms_sent, call_minutes
  count integer NOT NULL DEFAULT 0,
  month text NOT NULL, -- YYYY-MM format
  updated_at timestamptz DEFAULT now(),
  UNIQUE(business_id, metric_type, month)
);

CREATE INDEX IF NOT EXISTS idx_usage_metrics_business_month ON usage_metrics(business_id, month);

-- === migrations/agent-actions.sql ===
-- Agent actions table (activity feed + approval queue)
CREATE TABLE IF NOT EXISTS agent_actions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  action_type TEXT NOT NULL, -- review_response, sms_send, appointment_reminder, rebooking, campaign, gbp_post, report, system, call_response
  status TEXT NOT NULL DEFAULT 'pending', -- auto, approved, pending, rejected, expired
  title TEXT NOT NULL, -- "Responded to a 5-star review from Sarah M."
  description TEXT, -- Longer explanation / reasoning
  draft_content TEXT, -- The actual content (review response text, SMS text, etc.)
  final_content TEXT, -- What was actually sent (after edits)
  related_type TEXT, -- customer, review, call, appointment, campaign
  related_id UUID, -- ID of the related entity
  metadata JSONB DEFAULT '{}', -- Extra context (customer name, review rating, etc.)
  auto_expire_at TIMESTAMPTZ, -- When pending actions expire (default 24h)
  acted_on_at TIMESTAMPTZ, -- When approved/rejected
  acted_on_by TEXT, -- 'owner' or 'system' (auto-expire)
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_agent_actions_business ON agent_actions(business_id);
CREATE INDEX idx_agent_actions_status ON agent_actions(business_id, status);
CREATE INDEX idx_agent_actions_created ON agent_actions(created_at DESC);
CREATE INDEX idx_agent_actions_pending ON agent_actions(business_id, status, auto_expire_at) WHERE status = 'pending';

-- RLS
ALTER TABLE agent_actions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own business agent actions" ON agent_actions; CREATE POLICY "Users can view own business agent actions" ON agent_actions
  FOR SELECT USING (business_id IN (SELECT id FROM businesses WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Users can update own business agent actions" ON agent_actions; CREATE POLICY "Users can update own business agent actions" ON agent_actions
  FOR UPDATE USING (business_id IN (SELECT id FROM businesses WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Service role full access" ON agent_actions; CREATE POLICY "Service role full access" ON agent_actions
  FOR ALL USING (auth.role() = 'service_role');

-- === migrations/agent-conversations.sql ===
-- Agent chat conversation history
CREATE TABLE IF NOT EXISTS agent_conversations (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  role TEXT NOT NULL, -- 'user' or 'assistant'
  content TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_agent_conversations_business ON agent_conversations(business_id, created_at);

ALTER TABLE agent_conversations ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own conversations" ON agent_conversations; CREATE POLICY "Users can view own conversations" ON agent_conversations
  FOR SELECT USING (business_id IN (SELECT id FROM businesses WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Users can insert own conversations" ON agent_conversations; CREATE POLICY "Users can insert own conversations" ON agent_conversations
  FOR INSERT WITH CHECK (business_id IN (SELECT id FROM businesses WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Service role full access" ON agent_conversations; CREATE POLICY "Service role full access" ON agent_conversations
  FOR ALL USING (auth.role() = 'service_role');

-- === migrations/agent-settings.sql ===
-- Agent settings table (autonomy matrix + kill switch)
CREATE TABLE IF NOT EXISTS agent_settings (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL UNIQUE REFERENCES businesses(id) ON DELETE CASCADE,
  agent_status TEXT NOT NULL DEFAULT 'paused', -- active, paused, learning
  onboarding_week INTEGER DEFAULT 0, -- 0=not started, 1-4=onboarding, 5+=graduated
  autonomy_matrix JSONB DEFAULT '{
    "review_5star": "auto",
    "review_4star": "auto",
    "review_3star": "approval",
    "review_1_2star": "approval",
    "appointment_reminders": "auto",
    "rebooking_reminders": "auto",
    "review_requests": "auto",
    "sms_campaigns": "approval",
    "email_campaigns": "approval",
    "gbp_posts": "approval",
    "customer_sms_reply": "approval",
    "modify_schedule": "approval",
    "update_gbp_info": "approval",
    "flag_competitors": "auto",
    "generate_reports": "auto"
  }',
  sms_alerts JSONB DEFAULT '{
    "negative_reviews": true,
    "complaints": true,
    "unusual_activity": true,
    "errors": true
  }',
  owner_phone TEXT,
  daily_briefing_enabled BOOLEAN DEFAULT true,
  weekly_briefing_enabled BOOLEAN DEFAULT true,
  briefing_timezone TEXT DEFAULT 'America/New_York',
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE agent_settings ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own agent settings" ON agent_settings; CREATE POLICY "Users can view own agent settings" ON agent_settings
  FOR SELECT USING (business_id IN (SELECT id FROM businesses WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Users can update own agent settings" ON agent_settings; CREATE POLICY "Users can update own agent settings" ON agent_settings
  FOR UPDATE USING (business_id IN (SELECT id FROM businesses WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Service role full access" ON agent_settings; CREATE POLICY "Service role full access" ON agent_settings
  FOR ALL USING (auth.role() = 'service_role');

-- === migrations/calendar-sync.sql ===
-- Calendar Sync: Add columns to appointments table
ALTER TABLE appointments ADD COLUMN IF NOT EXISTS google_event_id TEXT;
ALTER TABLE appointments ADD COLUMN IF NOT EXISTS sync_status TEXT DEFAULT 'pending';
ALTER TABLE appointments ADD COLUMN IF NOT EXISTS synced_at TIMESTAMPTZ;
ALTER TABLE appointments ADD COLUMN IF NOT EXISTS end_time TIMESTAMPTZ;

-- Index for fast dedup lookups
CREATE INDEX IF NOT EXISTS idx_appointments_google_event_id ON appointments(google_event_id) WHERE google_event_id IS NOT NULL;

-- Calendar sync metadata on google_connections
ALTER TABLE google_connections ADD COLUMN IF NOT EXISTS calendar_id TEXT DEFAULT 'primary';
ALTER TABLE google_connections ADD COLUMN IF NOT EXISTS calendar_last_synced TIMESTAMPTZ;
ALTER TABLE google_connections ADD COLUMN IF NOT EXISTS calendar_event_count INTEGER DEFAULT 0;

-- === migrations/competitors.sql ===
-- Competitor tracking
CREATE TABLE IF NOT EXISTS competitors (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  google_place_id TEXT,
  google_maps_url TEXT,
  rating NUMERIC(2,1),
  review_count INTEGER DEFAULT 0,
  last_checked_at TIMESTAMPTZ,
  metadata JSONB DEFAULT '{}', -- stores latest review snapshot, photos count, etc.
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_competitors_business ON competitors(business_id);

-- Competitor snapshots (weekly tracking)
CREATE TABLE IF NOT EXISTS competitor_snapshots (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  competitor_id UUID NOT NULL REFERENCES competitors(id) ON DELETE CASCADE,
  rating NUMERIC(2,1),
  review_count INTEGER,
  new_reviews_count INTEGER DEFAULT 0,
  snapshot_data JSONB DEFAULT '{}', -- new reviews text, new posts, etc.
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_comp_snapshots ON competitor_snapshots(competitor_id, created_at DESC);

-- RLS
ALTER TABLE competitors ENABLE ROW LEVEL SECURITY;
ALTER TABLE competitor_snapshots ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage own competitors" ON competitors; CREATE POLICY "Users can manage own competitors" ON competitors
  FOR ALL USING (business_id IN (SELECT id FROM businesses WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Users can view own competitor snapshots" ON competitor_snapshots; CREATE POLICY "Users can view own competitor snapshots" ON competitor_snapshots
  FOR SELECT USING (competitor_id IN (SELECT id FROM competitors WHERE business_id IN (SELECT id FROM businesses WHERE user_id = auth.uid())));

DROP POLICY IF EXISTS "Service role full access competitors" ON competitors; CREATE POLICY "Service role full access competitors" ON competitors FOR ALL USING (auth.role() = 'service_role');
DROP POLICY IF EXISTS "Service role full access snapshots" ON competitor_snapshots; CREATE POLICY "Service role full access snapshots" ON competitor_snapshots FOR ALL USING (auth.role() = 'service_role');

-- === migrations/demo-requests.sql ===
CREATE TABLE IF NOT EXISTS demo_requests (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  business_name text NOT NULL,
  email text NOT NULL,
  phone text,
  business_type text,
  interests text,
  status text DEFAULT 'new',
  notes text,
  created_at timestamptz DEFAULT now()
);

-- No RLS needed — only server-side access via service key
ALTER TABLE demo_requests ENABLE ROW LEVEL SECURITY;

-- === migrations/gbp_posts_table.sql ===
-- GBP Posts table for local caching of Google Business Profile posts
CREATE TABLE IF NOT EXISTS gbp_posts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  google_post_id TEXT UNIQUE,
  post_type TEXT NOT NULL DEFAULT 'UPDATE' CHECK (post_type IN ('UPDATE', 'OFFER', 'EVENT')),
  text TEXT NOT NULL DEFAULT '',
  image_url TEXT,
  cta_type TEXT,
  cta_url TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('published', 'scheduled', 'draft')),
  views INTEGER DEFAULT 0,
  clicks INTEGER DEFAULT 0,
  published_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_gbp_posts_business ON gbp_posts(business_id);
CREATE INDEX IF NOT EXISTS idx_gbp_posts_status ON gbp_posts(status);
CREATE INDEX IF NOT EXISTS idx_gbp_posts_published ON gbp_posts(published_at DESC);

-- === migrations/google_connections.sql ===
-- Google OAuth Connections table
CREATE TABLE IF NOT EXISTS google_connections (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID NOT NULL,
  google_email TEXT,
  access_token TEXT,
  refresh_token TEXT,
  token_expires_at TIMESTAMPTZ,
  scopes TEXT[] DEFAULT '{}',
  gbp_account_id TEXT,
  gbp_location_id TEXT,
  gbp_location_name TEXT,
  status TEXT NOT NULL DEFAULT 'active',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_google_connections_business ON google_connections(business_id);
CREATE INDEX IF NOT EXISTS idx_google_connections_status ON google_connections(business_id, status);

-- Auto-update updated_at
CREATE OR REPLACE FUNCTION update_google_connections_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_google_connections_updated ON google_connections;
CREATE TRIGGER trg_google_connections_updated
  BEFORE UPDATE ON google_connections
  FOR EACH ROW EXECUTE FUNCTION update_google_connections_updated_at();

-- === migrations/industry-templates.sql ===
-- Industry Templates table
CREATE TABLE IF NOT EXISTS industry_templates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  industry_key TEXT UNIQUE NOT NULL,
  display_name TEXT NOT NULL,
  ai_phone_prompt TEXT,
  default_faqs JSONB DEFAULT '[]'::jsonb,
  default_services JSONB DEFAULT '[]'::jsonb,
  default_business_hours JSONB,
  post_appointment_flow JSONB DEFAULT '[]'::jsonb,
  dashboard_features JSONB DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add industry column to businesses
ALTER TABLE businesses ADD COLUMN IF NOT EXISTS industry TEXT;

-- === migrations/loyalty.sql ===
-- Loyalty program settings
CREATE TABLE IF NOT EXISTS loyalty_settings (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL UNIQUE REFERENCES businesses(id) ON DELETE CASCADE,
  enabled BOOLEAN DEFAULT false,
  points_per_dollar NUMERIC DEFAULT 1,
  points_per_visit INTEGER DEFAULT 10,
  tiers JSONB DEFAULT '[]',
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Loyalty members
CREATE TABLE IF NOT EXISTS loyalty_members (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  points INTEGER DEFAULT 0,
  lifetime_points INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(business_id, customer_id)
);

CREATE INDEX idx_loyalty_members_business ON loyalty_members(business_id);
CREATE INDEX idx_loyalty_members_points ON loyalty_members(business_id, points DESC);

-- Loyalty transactions
CREATE TABLE IF NOT EXISTS loyalty_transactions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  loyalty_member_id UUID NOT NULL REFERENCES loyalty_members(id) ON DELETE CASCADE,
  business_id UUID NOT NULL,
  points INTEGER NOT NULL,
  type TEXT NOT NULL, -- earn, redeem, adjust
  reason TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_loyalty_transactions ON loyalty_transactions(loyalty_member_id, created_at DESC);

-- RLS
ALTER TABLE loyalty_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE loyalty_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE loyalty_transactions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Service role full access" ON loyalty_settings; CREATE POLICY "Service role full access" ON loyalty_settings FOR ALL USING (auth.role() = 'service_role');
DROP POLICY IF EXISTS "Service role full access" ON loyalty_members; CREATE POLICY "Service role full access" ON loyalty_members FOR ALL USING (auth.role() = 'service_role');
DROP POLICY IF EXISTS "Service role full access" ON loyalty_transactions; CREATE POLICY "Service role full access" ON loyalty_transactions FOR ALL USING (auth.role() = 'service_role');

-- === migrations/missed-call-textback.sql ===
-- Missed Call Text-Back Smart Flow
-- Table for tracking missed call auto-texts

CREATE TABLE IF NOT EXISTS missed_call_texts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id TEXT NOT NULL,
  caller_phone TEXT NOT NULL,
  call_sid TEXT,
  message_sent TEXT,
  message_sid TEXT,
  status TEXT DEFAULT 'pending',
  sent_at TIMESTAMPTZ,
  booking_clicked BOOLEAN DEFAULT false,
  booking_clicked_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_mct_business ON missed_call_texts(business_id);
CREATE INDEX IF NOT EXISTS idx_mct_phone_sent ON missed_call_texts(business_id, caller_phone, sent_at);
CREATE INDEX IF NOT EXISTS idx_mct_created ON missed_call_texts(created_at DESC);

-- Enable RLS
ALTER TABLE missed_call_texts ENABLE ROW LEVEL SECURITY;

-- Policy: service role can do everything
DROP POLICY IF EXISTS "Service role full access" ON missed_call_texts; CREATE POLICY "Service role full access" ON missed_call_texts
  FOR ALL USING (true) WITH CHECK (true);

-- === migrations/phase-d-automation-flows.sql ===
-- Phase D: Smart Flow Automation Engine

CREATE TABLE IF NOT EXISTS automation_flows (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID NOT NULL,
  name TEXT NOT NULL,
  trigger_event TEXT NOT NULL,
  steps JSONB NOT NULL DEFAULT '[]',
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_automation_flows_business ON automation_flows(business_id);
CREATE INDEX IF NOT EXISTS idx_automation_flows_trigger ON automation_flows(business_id, trigger_event, active);

CREATE TABLE IF NOT EXISTS flow_executions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  flow_id UUID,
  business_id UUID,
  customer_id UUID,
  customer_email TEXT,
  customer_name TEXT,
  customer_phone TEXT,
  trigger_data JSONB DEFAULT '{}',
  current_step INT DEFAULT 0,
  status TEXT DEFAULT 'running',
  step_results JSONB DEFAULT '[]',
  next_step_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_flow_executions_flow ON flow_executions(flow_id);
CREATE INDEX IF NOT EXISTS idx_flow_executions_due ON flow_executions(status, next_step_at) WHERE status = 'running';

-- === migrations/phone-scripts-tables.sql ===
-- Phone Scripts, Calls & Usage tables
-- Run against Supabase SQL editor

CREATE TABLE IF NOT EXISTS phone_scripts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID NOT NULL,
  scenario VARCHAR(50) NOT NULL CHECK (scenario IN ('business_hours','after_hours','holiday','voicemail')),
  greeting TEXT,
  faq_responses JSONB DEFAULT '[]',
  booking_intent_script TEXT,
  transfer_rules JSONB DEFAULT '[]',
  closing TEXT,
  voice_id VARCHAR(100),
  personality JSONB DEFAULT '{"tone":50,"chattiness":40,"name":"Alex"}',
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(business_id, scenario)
);

CREATE TABLE IF NOT EXISTS phone_calls (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID NOT NULL,
  retell_call_id VARCHAR(100),
  caller_phone VARCHAR(50),
  caller_name VARCHAR(200),
  direction VARCHAR(20) DEFAULT 'inbound',
  status VARCHAR(50),
  scenario_used VARCHAR(50),
  duration_seconds INT,
  cost_cents INT,
  transcript TEXT,
  summary TEXT,
  outcome VARCHAR(50),
  customer_id UUID,
  started_at TIMESTAMPTZ,
  ended_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS phone_usage (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID NOT NULL,
  billing_period_start DATE NOT NULL,
  billing_period_end DATE,
  minutes_included INT,
  minutes_used NUMERIC(10,2) DEFAULT 0,
  overage_minutes NUMERIC(10,2) DEFAULT 0,
  overage_cost_cents INT DEFAULT 0,
  UNIQUE(business_id, billing_period_start)
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_phone_scripts_business ON phone_scripts(business_id);
CREATE INDEX IF NOT EXISTS idx_phone_calls_business ON phone_calls(business_id);
CREATE INDEX IF NOT EXISTS idx_phone_calls_started ON phone_calls(started_at DESC);
CREATE INDEX IF NOT EXISTS idx_phone_usage_business ON phone_usage(business_id);

-- === migrations/phone-usage-tables.sql ===
-- Add phone_minutes_limit to businesses table
ALTER TABLE businesses ADD COLUMN IF NOT EXISTS phone_minutes_limit INT DEFAULT 200;

-- Create usage_alerts table
CREATE TABLE IF NOT EXISTS usage_alerts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID REFERENCES businesses(id),
  alert_type TEXT NOT NULL CHECK (alert_type IN ('75_percent', '90_percent', 'limit_reached')),
  billing_cycle TEXT NOT NULL,
  sent_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_usage_alerts_business_cycle ON usage_alerts(business_id, alert_type, billing_cycle);

-- === migrations/referrals.sql ===
-- Referral program settings
CREATE TABLE IF NOT EXISTS referral_settings (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL UNIQUE REFERENCES businesses(id) ON DELETE CASCADE,
  enabled BOOLEAN DEFAULT false,
  referrer_reward TEXT DEFAULT '10% off next visit',
  referee_reward TEXT DEFAULT '10% off first visit',
  reward_type TEXT DEFAULT 'discount_pct',
  reward_value NUMERIC DEFAULT 10,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Referral links per customer
CREATE TABLE IF NOT EXISTS referral_links (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  code TEXT NOT NULL UNIQUE,
  referral_count INTEGER DEFAULT 0,
  conversion_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_referral_links_business ON referral_links(business_id);
CREATE INDEX idx_referral_links_code ON referral_links(code);

-- Referral conversions
CREATE TABLE IF NOT EXISTS referral_conversions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  referral_link_id UUID NOT NULL REFERENCES referral_links(id) ON DELETE CASCADE,
  business_id UUID NOT NULL,
  referrer_customer_id UUID,
  referred_customer_id UUID,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- RLS
ALTER TABLE referral_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE referral_links ENABLE ROW LEVEL SECURITY;
ALTER TABLE referral_conversions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Service role full access" ON referral_settings; CREATE POLICY "Service role full access" ON referral_settings FOR ALL USING (auth.role() = 'service_role');
DROP POLICY IF EXISTS "Service role full access" ON referral_links; CREATE POLICY "Service role full access" ON referral_links FOR ALL USING (auth.role() = 'service_role');
DROP POLICY IF EXISTS "Service role full access" ON referral_conversions; CREATE POLICY "Service role full access" ON referral_conversions FOR ALL USING (auth.role() = 'service_role');

-- === migrations/speed-to-lead.sql ===
-- Speed-to-Lead tables
-- Run against Supabase SQL editor

-- Sequences: one per lead entering the flow
CREATE TABLE IF NOT EXISTS speed_to_lead_sequences (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL,
  contact_id UUID,
  contact_phone TEXT NOT NULL,
  contact_name TEXT,
  source TEXT DEFAULT 'manual',
  status TEXT DEFAULT 'active' CHECK (status IN ('active','paused','completed','converted','cancelled')),
  current_step INTEGER DEFAULT 0,
  total_steps INTEGER DEFAULT 5,
  started_at TIMESTAMPTZ DEFAULT NOW(),
  last_step_at TIMESTAMPTZ,
  next_step_at TIMESTAMPTZ,
  paused_at TIMESTAMPTZ,
  pause_reason TEXT,
  completed_at TIMESTAMPTZ,
  converted_at TIMESTAMPTZ,
  config_snapshot JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Steps: individual messages in a sequence
CREATE TABLE IF NOT EXISTS speed_to_lead_steps (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  sequence_id UUID NOT NULL REFERENCES speed_to_lead_sequences(id) ON DELETE CASCADE,
  step_number INTEGER NOT NULL,
  message_template TEXT NOT NULL,
  delay_minutes INTEGER DEFAULT 0,
  channel TEXT DEFAULT 'sms',
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending','sent','skipped','failed')),
  scheduled_for TIMESTAMPTZ,
  sent_at TIMESTAMPTZ,
  message_sid TEXT,
  dry_run BOOLEAN DEFAULT FALSE,
  error TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- SMS opt-outs (if not exists)
CREATE TABLE IF NOT EXISTS sms_opt_outs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  phone TEXT NOT NULL,
  business_id UUID NOT NULL,
  opted_out_at TIMESTAMPTZ DEFAULT NOW(),
  reason TEXT
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_stl_seq_business ON speed_to_lead_sequences(business_id, status);
CREATE INDEX IF NOT EXISTS idx_stl_seq_phone ON speed_to_lead_sequences(contact_phone, status);
CREATE INDEX IF NOT EXISTS idx_stl_steps_due ON speed_to_lead_steps(status, scheduled_for) WHERE status = 'pending';
CREATE INDEX IF NOT EXISTS idx_stl_steps_seq ON speed_to_lead_steps(sequence_id, step_number);
CREATE INDEX IF NOT EXISTS idx_sms_opt_outs ON sms_opt_outs(phone, business_id);

-- RLS policies
ALTER TABLE speed_to_lead_sequences ENABLE ROW LEVEL SECURITY;
ALTER TABLE speed_to_lead_steps ENABLE ROW LEVEL SECURITY;

-- Allow service role full access
DROP POLICY IF EXISTS "service_role_stl_seq" ON speed_to_lead_sequences; CREATE POLICY "service_role_stl_seq" ON speed_to_lead_sequences FOR ALL USING (true) WITH CHECK (true);
DROP POLICY IF EXISTS "service_role_stl_steps" ON speed_to_lead_steps; CREATE POLICY "service_role_stl_steps" ON speed_to_lead_steps FOR ALL USING (true) WITH CHECK (true);

-- === migrations/voicemails-table.sql ===
-- Voicemails table
-- Run: psql or Supabase SQL editor

CREATE TABLE IF NOT EXISTS voicemails (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  caller_phone TEXT,
  caller_name TEXT,
  recording_url TEXT,
  transcription TEXT,
  ai_summary TEXT,
  duration_seconds INTEGER DEFAULT 0,
  is_read BOOLEAN DEFAULT false,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_voicemails_business_id ON voicemails(business_id);
CREATE INDEX idx_voicemails_created_at ON voicemails(created_at DESC);
CREATE INDEX idx_voicemails_is_read ON voicemails(business_id, is_read);

-- === migrations/voicemails.sql ===
-- Voicemails table
CREATE TABLE IF NOT EXISTS voicemails (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  caller_phone TEXT,
  caller_name TEXT,
  recording_url TEXT,
  transcription TEXT,
  ai_summary TEXT,
  duration_seconds INTEGER DEFAULT 0,
  is_read BOOLEAN DEFAULT false,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_voicemails_business ON voicemails(business_id);
CREATE INDEX idx_voicemails_created ON voicemails(created_at DESC);
CREATE INDEX idx_voicemails_unread ON voicemails(business_id, is_read) WHERE is_read = false;

-- RLS
ALTER TABLE voicemails ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own business voicemails" ON voicemails; CREATE POLICY "Users can view own business voicemails" ON voicemails
  FOR SELECT USING (business_id IN (SELECT id FROM businesses WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Users can update own business voicemails" ON voicemails; CREATE POLICY "Users can update own business voicemails" ON voicemails
  FOR UPDATE USING (business_id IN (SELECT id FROM businesses WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Service role full access" ON voicemails; CREATE POLICY "Service role full access" ON voicemails
  FOR ALL USING (auth.role() = 'service_role');
