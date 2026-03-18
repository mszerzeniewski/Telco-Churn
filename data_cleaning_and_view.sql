create or replace view v_telco_churn_analysis as
select
customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents,
    tenure AS tenure_months,
    case
		when tenure <= 12 then '1. New (0-1 year)'
        when tenure <= 24 then '2. Regular (1-2 years)'
        when tenure <= 48 then '3. Loyal (2-4 years)'
        else '4. Veteran (4+)'
        end as tenure_status,
	Contract,
	InternetService,
	PaymentMethod,
	MonthlyCharges,
    cast(nullif(trim(totalcharges),'') as decimal(10,2)) as TotalCharges_Clean, -- trim kasuje spacje, nullif wrzuca null jezeli pusty text, cast przerabia na dziesiętny
	case when Churn = 'Yes' then 1 else 0 end as is_churn,
    case 
        when Contract = 'Month-to-month' and PaymentMethod = 'Electronic check' then 'Wysokie Ryzyko' -- umowa na miesiac, płacenie na poczcie 
        when Contract = 'One year' then 'Średnie Ryzyko' -- kontrakt na rok
        else 'Niskie Ryzyko'
    end as risk_level
from telco_customer_churn