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

  scenario 'Create a new timer entry' do
    expect(timer_page).not_to have_modal
    expect(timer_page).to have_new_timer_btn
    
    timer_page.new_timer_btn.click
    timer_page.wait_for_modal
    
    expect(timer_page.modal).to be_visible
    expect(timer_page.modal.title.text).to eq 'New Time Entry'

    timer_page.modal.select_project.select('Google - New Rails App')
    timer_page.modal.select_task.select('Write the codes')
    timer_page.modal.description.set('Working on the home page')
    timer_page.modal.create_btn.click
    timer_page.wait_until_modal_invisible

    expect(timer_page).to have_stop_btn
    
    timer_page.stop_btn.click
    timer_page.wait_for_edit_btns

    expect(timer_page).to have_edit_btns
    expect(timer_page).to have_start_btns
  end

  scenario 'Edit a timer entry' do
    timer_page.new_timer_btn.click
    timer_page.wait_for_modal

    timer_page.modal.select_project.select('Yahoo - Refactor Application')
    timer_page.modal.select_task.select('Write the codes')
    timer_page.modal.description.set('Refactoring tests')
    timer_page.modal.create_btn.click
    timer_page.wait_until_modal_invisible
    
    timer_page.stop_btn.click
    timer_page.wait_for_edit_btns
    timer_page.edit_btns.first.click
    timer_page.wait_for_modal

    expect(timer_page.modal).to have_update_btn
    expect(timer_page.modal).to have_delete_btn

    timer_page.modal.duration.set('1.75')
    timer_page.modal.update_btn.click
    timer_page.wait_until_modal_invisible

    expect(timer_page.time_values.first.text).to eq '1 hr 45 min'
  end
end

