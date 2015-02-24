require 'spec_helper'
require_relative 'user_data'

require_relative 'site_prism/sign_in_page'
require_relative 'site_prism/timer_page'

feature 'Timer page functionality' do
  
  let(:sign_in_page) { SignInPage.new }
  let(:timer_page) { TimerPage.new }
  let(:worker) { User.new }

  background do
    sign_in_page.load
    sign_in_page.sign_in(worker.user[:username], worker.user[:password])

    if timer_page.has_stop_btn?
      timer_page.stop_btn.click
    end
    
    if timer_page.has_edit_btns?
      timer_page.edit_btns.each do
        timer_page.edit_btns.first.click
        timer_page.wait_for_modal
        timer_page.modal.delete_btn.click
        timer_page.wait_until_modal_invisible
      end
    end
  end

  scenario 'Create a new entry' do
    expect(timer_page).not_to have_modal
    expect(timer_page).to have_new_timer_btn
    timer_page.new_timer_btn.click
    timer_page.wait_for_modal
    expect(timer_page.modal).to be_visible
    expect(timer_page.modal.title.text).to eq 'New Time Entry'

    timer_page.modal.select_project.select('ACME3 - New Rails App')
    timer_page.modal.select_task.select('Write the codes')
    timer_page.modal.description.set('Working on the home page')
    timer_page.modal.create_btn.click
    
    sleep(80)
    timer_page.stop_btn.click
    timer_page.wait_for_edit_btns
    timer_page.edit_btns.first.click
    timer_page.wait_for_modal
    expect(timer_page.modal.duration.value).to eq '0.02'
  end
end