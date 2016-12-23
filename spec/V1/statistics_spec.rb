require 'spec_helper'

describe DolDataSDK::V1::Statistics do
  include DolDataSDK::Utilities
  let(:base_url){'api.dol.gov/V1/Statistics/'}

  context "oui_initial_claims" do
    it 'should make a request to the API with OUI_InitialClaims and its dataset' do
      expect(DolDataSDK::V1::Statistics.oui_initial_claims("unemploymentInsuranceInitialClaims")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "OUI_InitialClaims/unemploymentInsuranceInitialClaims")).once
    end
  end

  context "pwsd" do
    it 'should make a request to the API with PWSD and its dataset' do
      expect(DolDataSDK::V1::Statistics.pwsd("esFinal")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "PWSD/esFinal")).once
    end
  end

  context "cew" do
    it 'should make a request to the API with CEW and its dataset' do
      expect(DolDataSDK::V1::Statistics.cew("EN_INDUSTRY")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "CEW/EN_INDUSTRY")).once
    end
  end

  context "oes" do
    it 'should make a request to the API with OES and its dataset' do
      expect(DolDataSDK::V1::Statistics.oes("OE_SEASONAL")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "OES/OE_SEASONAL")).once
    end
  end

  context "cps" do
    it 'should make a request to the API with CPS and its dataset' do
      expect(DolDataSDK::V1::Statistics.cps("LE_AGES")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "CPS/LE_AGES")).once
    end
  end

  context "ces" do
    it 'should make a request to the API with CES and its dataset' do
      expect(DolDataSDK::V1::Statistics.ces("CU_DATA_PUB")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "CES/CU_DATA_PUB")).once
    end
  end


  context "cpi" do
    it 'should make a request to the API with CPI and its dataset' do
      expect(DolDataSDK::V1::Statistics.cpi("CU_AREA")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "CPI/CU_AREA")).once
    end
  end

  context "wia" do
    it 'should make a request to the API with WIA and its dataset' do
      expect(DolDataSDK::V1::Statistics.wia("workforceInvestmentAct")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "WIA/workforceInvestmentAct")).once
    end
  end

  context "oes2010" do
    it 'should make a request to the API with oes2010 and its dataset' do
      expect(DolDataSDK::V1::Statistics.oes2010("area_definitions")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "OES2010/area_definitions")).once
    end
  end

  context "bls_numbers" do
    it 'should make a request to the API with BLS_Numbers and its dataset' do
      expect(DolDataSDK::V1::Statistics.bls_numbers("exportPriceIndex")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "BLS_Numbers/exportPriceIndex")).once
    end
  end

end
