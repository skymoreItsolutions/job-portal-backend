<?php

namespace App\Filament\Resources;

use App\Filament\Resources\JobPostingResource\Pages;
use App\Filament\Resources\JobPostingResource\RelationManagers;
use App\Models\JobPosting;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Repeater;
use Filament\Tables\Columns\TextColumn;
class JobPostingResource extends Resource
{
    protected static ?string $model = JobPosting::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('employer_id')
                ->label('Employer')
                ->relationship('employer', 'company_name')
                ->required(),

            TextInput::make('job_title')->required()->maxLength(255),

            Select::make('job_type')
                ->options([
                    'full_time' => 'Full Time',
                    'part_time' => 'Part Time',
                    'internship' => 'Internship',
                    'freelance' => 'Freelance',
                ])
                ->required(),

            TextInput::make('location')->required(),
            Select::make('work_location_type')
                ->options([
                    'remote' => 'Remote',
                    'onsite' => 'Onsite',
                    'hybrid' => 'Hybrid',
                ])
                ->required(),

            TextInput::make('compensation')->required(),
            Select::make('pay_type')
                ->options([
                    'hourly' => 'Hourly',
                    'monthly' => 'Monthly',
                    'yearly' => 'Yearly',
                ])
                ->required(),

            TextInput::make('joining_fee')->numeric()->nullable(),

            Textarea::make('basic_requirements')->required(),
            Repeater::make('additional_requirements')
                ->schema([
                    TextInput::make('value'),
                ])
                ->label('Additional Requirements')
                ->defaultItems(1)
                ->addActionLabel('Add Requirement'),

            Textarea::make('job_description')->required(),

            Toggle::make('is_walkin_interview')
                ->label('Is Walk-In Interview?'),

            Select::make('communication_preference')
                ->options([
                    'email' => 'Email',
                    'phone' => 'Phone',
                    'both' => 'Both',
                ])
                ->required(),

            TextInput::make('total_experience_required')
                ->numeric()
                ->label('Experience Required (Years)')
                ->nullable(),

            Repeater::make('other_job_titles')
                ->schema([
                    TextInput::make('value'),
                ])
                ->defaultItems(1)
                ->addActionLabel('Add Title'),

            Repeater::make('degree_specialization')
                ->schema([
                    TextInput::make('value'),
                ])
                ->defaultItems(1)
                ->addActionLabel('Add Specialization'),

            DatePicker::make('job_expire_time')
                ->label('Job Expiry Date')
                ->required(),

            TextInput::make('number_of_candidates_required')
                ->numeric()
                ->required()
                ->label('No. of Candidates Required'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('employer.company_name')->label('Employer'),
                TextColumn::make('job_title')->searchable()->sortable(),
                TextColumn::make('job_type')->badge(),
                TextColumn::make('location'),
                TextColumn::make('pay_type'),
                TextColumn::make('job_expire_time')->date(),

            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListJobPostings::route('/'),
            'create' => Pages\CreateJobPosting::route('/create'),
            'edit' => Pages\EditJobPosting::route('/{record}/edit'),
        ];
    }
}
