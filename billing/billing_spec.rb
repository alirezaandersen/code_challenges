RSpec.describe 'bill_for' do
  let(:user_signed_up) do
    [
      {
        id: 1,
        name: 'Employee #1',
        activated_on: Date.new(2018, 11, 4),
        deactivated_on: nil,
        customer_id: 1,
      },
      {
        id: 2,
        name: 'Employee #2',
        activated_on: Date.new(2018, 12, 4),
        deactivated_on: nil,
        customer_id: 1,
      },
      {
        id: 3,
        name: 'Employee #3',
        activated_on: Date.new(2019, 1, 10),
        deactivated_on: nil,
        customer_id: 1,
      },
    ]
  end

  let(:constant_users) do
    [
      {
        id: 1,
        name: 'Employee #1',
        activated_on: Date.new(2018, 11, 4),
        deactivated_on: nil,
        customer_id: 1,
      },
      {
        id: 2,
        name: 'Employee #2',
        activated_on: Date.new(2018, 12, 4),
        deactivated_on: nil,
        customer_id: 1,
      },
    ]
  end

  let(:new_plan) do
    {
      id: 1,
      customer_id: 1,
      monthly_price_in_dollars: 4
    }
  end

  let(:no_users) { [] }

  it 'works when the customer has no active users during the month' do
    expect(bill_for('2019-01', new_plan, no_users)).to be_within(0.01).of(0.00)
  end

  it 'works when everything stays the same for a month' do
    expect(bill_for('2019-01', new_plan, constant_users)).to be_within(0.01).of(8.00)
  end

  it 'works when a user is activated during the month' do
    expect(bill_for('2019-01', new_plan, user_signed_up)).to be_within(0.01).of(10.84)
  end
end
